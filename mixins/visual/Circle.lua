local drystal = require 'drystal'

local _ = {}

function _:init_visual_circle(visual_color)
	self.visual_circle_color = visual_color
end

function _:draw_visual_circle()
	drystal.set_color(self.visual_circle_color)
	drystal.draw_circle(self.x, self.y, self.radius)
end

return _

