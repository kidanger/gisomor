local _ = {}

function _:init_shaking()
	self.shaking = 0
end

function _:shake(duration)
	self.shaking = self.shaking + duration
end

function _:update_shaking(dt)
	if self.shaking > 0 then
		self.x = self.x + math.random(20) - 10
		self.y = self.y + math.random(20) - 10
		self.shaking = self.shaking - dt
		if self.shaking < 0 then
			self.shaking = 0
		end
	end
end

return _

