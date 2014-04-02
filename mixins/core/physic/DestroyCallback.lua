local _ = {}

function _:init_physic_destroy_callback()
	self:add_on_destroy_callback(function ()
		self.body:destroy()
		self.body = nil
	end)
end

return _

