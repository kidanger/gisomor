local _ = {}

function _:init_shaking()
	self.shaking = 0
end

function _:shake(intensity)
	self.shaking = self.shaking + intensity
end

function _:update_shaking(dt)
	if self.shaking > 1 then
		self.x = self.x + (math.random(self.shaking)-self.shaking/2) * dt *100
		self.y = self.y + (math.random(self.shaking)-self.shaking/2) * dt *100
		self.shaking = self.shaking - dt
		if self.shaking < 0 then
			self.shaking = 0
		end
	end
end

return _

