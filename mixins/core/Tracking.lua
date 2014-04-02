local _ = {}

function _:init_tracking(tracking_ratio)
	self.tracking_ratio = tracking_ratio
	self.track = nil
end

function _:track(entity)
	self.track = entity
end

function _:update_tracking(dt)
	if self.track then
		self.x = self.x + (self.track.x - self.x) * self.tracking_ratio
		self.y = self.y + (self.track.y - self.y) * self.tracking_ratio
	end
end

return _

