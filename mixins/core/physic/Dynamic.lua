local _ = {}

_.is_dynamic = true

function _:update_physic_dynamic()
	local x, y = self.body:get_position()
	self.x = x
	self.y = y
	self.angle = self.body:get_angle()
end

return _

