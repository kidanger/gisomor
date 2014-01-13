local _ = {}

function _:init_tracking()
	self.track = nil
end

function _:track(entity)
	self.track = entity
end

function _:update_tracking(dt)
	if self.track then
		self.x = self.x + (self.track.x - self.x) / 10
		self.y = self.y + (self.track.y - self.y) / 10
	end
end

return _

