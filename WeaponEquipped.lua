local _ = {}

function _:init_weapon_equipped()
	self.weapon = nil
	self.weapons = {}
	self.current_weapon_index = 0
end

function _:give_weapon(weapon)
	table.insert(self.weapons, weapon)
	self:add_ammo(weapon, weapon.ammo_max)
	if self.current_weapon_index == 0 then
		self:select_next_weapon()
	end
end

function _:select_next_weapon()
	self.current_weapon_index = self.current_weapon_index % #self.weapons + 1
	self.weapon = self.weapons[self.current_weapon_index]
end
function _:select_previous_weapon()
	self.current_weapon_index = (self.current_weapon_index - 2) % #self.weapons + 1
	self.weapon = self.weapons[self.current_weapon_index]
end

return _

