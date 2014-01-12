local _ = {}

function _:init_health(maxhealth)
	self.health = maxhealth
	self.maxhealth = maxhealth
end

function _:remove_health(num)
	self.health = self.health - num

	if self.health < 0 then
		self.health = 0
	end
end

function _:add_health(num)
	self.health = self.health + num

	if self.health > self.maxhealth then
		self.health = self.maxhealth
	end
end

function _:is_dead()
	return self.health == 0
end

return _
