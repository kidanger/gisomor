local drystal = require 'drystal'

local _ = {}

function _:draw_visual_rectangle()
	drystal.set_alpha(255)
	local color = self.color.visual
	drystal.set_color(color)
	drystal.draw_rect_rotated(self.x - self.w/2, self.y - self.h/2, self.w, self.h, self.angle or 0)
end

return _

