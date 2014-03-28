local _ = {}

function _:init_ammo_regeneration()
	self.ammo_regen_timer = 0
end

function _:regenerate_ammo(dt)
	if not self.weapon or self.fire_cooldown ~= 0 then
		return
	end

	self.ammo_regen_timer = self.ammo_regen_timer + dt

	while self.ammo_regen_timer > self.weapon.ammo_regen_delay do
		self:add_ammo(self.weapon, 1)
		self.ammo_regen_timer = self.ammo_regen_timer - self.weapon.ammo_regen_delay
	end
end

return _

