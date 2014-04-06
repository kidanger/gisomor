local _ = {}

function _:init_ammo(max)
	self.ammo_max = max
	self.ammo = max
end

function _:consume_ammo(amount)
	self.ammo = self.ammo - amount
	if self.ammo < 0 then
		self.ammo = 0
	end
end


function _:add_ammo(amount)
	if self.ammo + amount < self.ammo_max then
		self.ammo = self.ammo + amount
	else
		self.ammo = self.ammo_max
	end
end

return _

