local drystal = require 'drystal'

local _ = {}

function _:init_health_bar(width, height, offy)
	self.health_bar_width = width
	self.health_bar_height = height
	self.health_bar_offset_y = offy or 0
end

function _:draw_health_bar()
	assert(self.maxhealth)
	local ratio = self.health / self.maxhealth

	local x = self.x - self.health_bar_width / 2
	local y = self.y - self.health_bar_height / 2 + self.health_bar_offset_y

	drystal.set_color(0, 0, 0)
	drystal.draw_rect(x, y, self.health_bar_width, self.health_bar_height)

	drystal.set_color(200, 20, 20)
	drystal.draw_rect(x + 1, y + 1, (self.health_bar_width - 2)*ratio, self.health_bar_height - 2)
end

return _
