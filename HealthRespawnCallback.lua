local _ = {}

function _:init_health_respawn_callback()
	self:add_on_respawn_callback(function ()
		self:reset_health()
		self:remove_health(self.maxhealth/2)
	end)
end

return _

