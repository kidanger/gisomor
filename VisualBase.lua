local drystal = require 'drystal'

local _ = {}

function _:draw_visual_base()
	drystal.set_alpha(255)

	if self.is_protected then
		local grey = (math.sin(self.time * 5) / 2 + 0.5) * 50 + 20
		drystal.set_color(grey, grey, grey)
		local w, h = self.w * 1.05, self.h * 1.05
		drystal.draw_rect(self.x - w/2, self.y - h/2, w, h)
	end

	drystal.set_color(self.color.visual_base)
	drystal.draw_rect(self.x - self.w/2, self.y - self.h/2, self.w, self.h)
end

return _

