local _ = {}

function _:init_weapon_cooldown(max_cooldown)
	self.max_cooldown = max_cooldown
	self.cooldown = 0
end

function _:update_weapon_cooldown(dt)
	if self.cooldown > 0 then
		self.cooldown = self.cooldown - dt
		if self.cooldown < 0 then
			self.cooldown = 0
		end
	end
end

function _:set_cooldown()
	self.cooldown = self.max_cooldown
end

function _:cooldown_is_down()
	return self.cooldown == 0
end

return _

