local _ = {}

function _:init_points(maxpoints)
	self.points = maxpoints
	self.maxpoints = maxpoints
end

function _:remove_points(num)
	self.points = self.points - num

	if self.points < 0 then
		self.points = 0
	end
end

function _:add_points(num)
	self.points = self.points + num

	if self.points > self.maxpoints then
		self.points = self.maxpoints
	end
end

function _:reset_points()
	self.points = self.maxpoints
end

return _

