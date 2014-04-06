local _ = {}

function _:init_weapon_control()
	self.want_fire = false
end

function _:update_weapon_control(dt)
	if self.want_fire and self:can_fire() then
		self:fire()
	end
end

return _

