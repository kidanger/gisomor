local _ = {}

function _:init_respawnable(respawn_manager)
	self.associated_respawn_manager = respawn_manager
end

function _:ask_respawn()
	self.associated_respawn_manager:add_to_respawn_list(self)
end

function _:on_respawn(respawner)
	self.x = respawner.x
	self.y = respawner.y

	if self.call_respawn_callbacks then
		self:call_respawn_callbacks()
	end
end

return _

