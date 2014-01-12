local _ = {}

function _:init_points_regeneration(points_regeneration_per_second)
	self.points_regeneration_per_second = points_regeneration_per_second
end

function _:regenerate_points(dt)
	if self.points < self.maxpoints then
		self:add_points(self.points_regeneration_per_second * dt)
	end
end

return _


