local _ = {}

local Bullet = require 'Bullet'

function _:init_fire_control()
	self.fire = false
end

function _:update_fire_control()
	if self.fire then
		local angle = self.angle
		local x = self.x + math.cos(angle) * 40
		local y = self.y + math.sin(angle) * 40
		create_entity(Bullet, self, x, y, angle)
	end
end

return _

