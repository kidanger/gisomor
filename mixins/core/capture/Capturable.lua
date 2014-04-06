local _ = {}

local colors = require 'data.colors'

function _:init_capturable(points_capture_per_second)
	self.points_capture_per_second = points_capture_per_second

	self.is_being_captured = false
	self.capturing_color = nil
	self.is_being_captured_by = {}
end

function _:can_be_captured_by(entity)
	return not self:path_is_locked(entity.color)
end

function _:begin_capture(entity)
	self.is_being_captured_by[entity] = true
end
function _:end_capture(entity)
	self.is_being_captured_by[entity] = nil
end

function _:update_capturable(dt)
	local color_count = {}
	for k, c in pairs(colors) do
		color_count[c] = 0
	end
	for ent in pairs(self.is_being_captured_by) do
		if self:can_be_captured_by(ent) then
			color_count[ent.color] = color_count[ent.color] + 1
		end
	end

	local capturing = false
	local capturing_speed
	local capturing_color
	for k, c in pairs(colors) do
		local diff = color_count[c] - color_count[self.color]
		if c ~= self.color and diff > 0 then
			capturing = true
			capturing_speed = diff
			capturing_color = c
			break
		end
	end

	if capturing then
		self:remove_points(self.points_capture_per_second * dt * capturing_speed)
		if self.points == 0 then
			self:set_capture_color(capturing_color)
			capturing = false
		end
	end

	self.is_being_captured = capturing
	self.capturing_color = capturing_color
end

function _:set_capture_color(color)
	self:set_color(color)
	self:reset_points()
end

return _

