local drystal = require 'drystal'

local _ = {}

function _:init_capture_bar(width, height, offy)
	self.capture_bar_width = width
	self.capture_bar_height = height
	self.capture_bar_offset_y = offy or 0
end

function _:draw_capture_bar()
	drystal.set_alpha(255)

	local ratio = self.points / self.maxpoints

	local x = self.x - self.capture_bar_width / 2
	local y = self.y - self.capture_bar_height / 2 + self.capture_bar_offset_y

	drystal.set_color(0, 0, 0)
	drystal.draw_rect(x, y, self.capture_bar_width, self.capture_bar_height)

	drystal.set_color(self.color.visual)
	drystal.draw_rect(x + 2, y + 2, (self.capture_bar_width - 4)*ratio, self.capture_bar_height - 4)
end

return _

