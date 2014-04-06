local _ = {}

function _:init_ammo_regeneration(delay)
	self.ammo_regen_timer = 0
	self.ammo_regen_delay = delay
end

function _:regenerate_ammo(dt)
	if not self:cooldown_is_down() then
		return
	end

	self.ammo_regen_timer = self.ammo_regen_timer + dt

	while self.ammo_regen_timer > self.ammo_regen_delay do
		self:add_ammo(1)
		self.ammo_regen_timer = self.ammo_regen_timer - self.ammo_regen_delay
	end
end

return _

