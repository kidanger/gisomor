local _ = {}

function _:init_ammo()
	self.ammunitions = {}
end

function _:has_ammo_left()
	return self.ammunitions[self.weapon] > 0
end

function _:consume_ammo()
	assert(self:has_ammo_left())
	self.ammunitions[self.weapon] = self.ammunitions[self.weapon] - 1
end

function _:add_ammo(weapon, amount)
	if not self.ammunitions[weapon] then
		self.ammunitions[weapon] = 0
	end
	if self.ammunitions[weapon] + amount > weapon.ammo_max then
		self.ammunitions[weapon] = weapon.ammo_max
	else
		self.ammunitions[weapon] = self.ammunitions[weapon] + amount
	end
end

return _

