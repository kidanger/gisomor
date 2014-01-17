local _ = {}

function _:init_physic_respawn_callback()
	self:add_on_respawn_callback(function ()
		self.body:set_position(self.x / R, self.y / R)
		self.body:set_active(true)
	end)
end

return _


