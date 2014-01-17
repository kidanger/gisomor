local _ = {}

function _:init_respawnable(respawn_manager)
	self.associated_respawn_manager = respawn_manager
	self.on_respawn_callbacks = {}
end

function _:add_on_respawn_callback(callback)
	table.insert(self.on_respawn_callbacks, callback)
end

function _:on_respawn(respawner)
	self.x = respawner.x
	self.y = respawner.y
	for _, f in ipairs(self.on_respawn_callbacks) do
		f(self)
	end
end

function _:ask_respawn()
	self.associated_respawn_manager:add_to_respawn_list(self)
end

return _

