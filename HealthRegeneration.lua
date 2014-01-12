local HealthRegeneration = {}

function HealthRegeneration:init_health_regeneration(health_per_second)
	self.health_per_second = health_per_second
end

function HealthRegeneration:regenerate_health(dt)
	if self.health < self.maxhealth then
		self:add_health(self.health_per_second * dt)
	end
end

return HealthRegeneration

