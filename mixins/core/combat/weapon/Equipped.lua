local _ = {}

local Weapon = require 'Weapon'

function _:init_weapon_equipped()
	self.weapon = nil
	self.weapons = {}
	self.current_weapon_index = 0
end

function _:give_weapon(weapon_type)
	local weapon = Weapon:new(self, weapon_type)

	table.insert(self.weapons, weapon)
	if self.current_weapon_index == 0 then
		self:select_next_weapon()
	end
end

function _:_update_current_weapon(new)
	local was_firing = false
	if self.weapon then
		was_firing = self.weapon.want_fire
		self.weapon.want_fire = false
	end

	self.weapon = self.weapons[self.current_weapon_index]
	self.weapon.want_fire = was_firing
	self.weapon.x = self.x
	self.weapon.y = self.y
	self.weapon.angle = self.angle
end

function _:select_next_weapon()
	self.current_weapon_index = self.current_weapon_index % #self.weapons + 1
	self:_update_current_weapon()
end

function _:select_previous_weapon()
	self.current_weapon_index = (self.current_weapon_index - 2) % #self.weapons + 1
	self:_update_current_weapon()
end

return _

