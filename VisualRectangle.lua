local drystal = require 'drystal'

local _ = {}

function _:init_visual_rectangle(visual_color)
	self.visual_rectangle_color = visual_color
end

function _:draw_visual_rectangle()
	drystal.set_alpha(255)
	drystal.set_color(self.visual_rectangle_color)
	drystal.draw_rect_rotated(self.x - self.w/2, self.y - self.h/2, self.w, self.h, self.angle or 0)
end

return _

