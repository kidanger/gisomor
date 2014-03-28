local _ = {}

local Bullet = require 'Bullet'

function _:init_fire_control()
	self.fire = false
	self.fire_cooldown = 0
end

function _:update_fire_control(dt)
	if self.fire_cooldown then
		self.fire_cooldown = self.fire_cooldown - dt
		if self.fire_cooldown < 0 then
			self.fire_cooldown = 0
		end
	end

	if not self.weapon then
		return
	end

	if self.fire and self.fire_cooldown == 0 and self:has_ammo_left() then
		local angle = self.angle
		for i = 1, self.weapon.num_bullets do
			local spread = math.random() * self.weapon.spread - self.weapon.spread / 2
			local x = self.x + math.cos(angle + spread) * 40
			local y = self.y + math.sin(angle + spread) * 40
			create_entity(Bullet, self, x, y, angle + spread, self.weapon)
		end
		self.fire_cooldown = self.weapon.cooldown

		self:consume_ammo(1)
	end
end

return _

