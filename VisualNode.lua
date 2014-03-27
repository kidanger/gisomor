local drystal = require 'drystal'

local _ = {}

function _:draw_visual_node()
	local alpha = 255
	if self.is_being_captured then
		alpha = (math.sin(self.time * 4.2) * .5 + .5) * 150 + 100
	end
	drystal.set_alpha(alpha)

	local color = self.color.visual_capture_point
	drystal.set_color(color)
	drystal.draw_circle(self.x, self.y, self.radius)

	drystal.set_alpha(255)
	if self.is_being_captured then
		local color = self.capturing_color.visual_capture_point
		drystal.set_color(color)
		local rad = (1 - self.points / self.maxpoints) * self.radius
		rad = rad + (math.sin(self.time*10) * 10)
		rad = math.max(0, rad)
		drystal.draw_circle(self.x, self.y, rad)
	end
end

return _

