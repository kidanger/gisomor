local colors = require 'colors'

local _ = {}

_.SPEED_BOOST = 4

local keymap = {
	z='up',
	s='down',
	q='left',
	d='right',
}
local interesting_keys = {
	up=true, down=true, left=true, right=true
}
function _:key_press(key)
	key = keymap[key] or key
	if key == 'v' then
		local newcolor = self.color == colors.blue and colors.red or colors.blue
		self:set_color(newcolor)
		self:init_visual_rectangle(newcolor.visual_character)
	elseif key == 'c' and not self._boosting then
		self.speed = self.speed * self.SPEED_BOOST
		self._boosting = true
	elseif key == 'k' then
		self:remove_health(3.4)
	elseif key == 'w' then
		self:select_next_weapon()
	elseif key == 'l' then
		self:select_previous_weapon()
	elseif interesting_keys[key] then
		self[key] = true
	end
end

function _:key_release(key)
	key = keymap[key] or key
	if key == 'c' then
		self.speed = self.speed / self.SPEED_BOOST
		self._boosting = false
	elseif interesting_keys[key] then
		self[key] = false
	end
end

function _:mouse_motion(x, y, dx, dy)
	local angle = math.atan2(y - H / 2, x - W / 2)
	self.target_angle = angle
end

function _:mouse_press(x, y, b)
	self.fire = true
end

function _:mouse_release(x, y, b)
	self.fire = false
end

return _

