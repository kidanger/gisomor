local _ = {}

function _:init_respawn_callbacks()
	self.on_respawn_callbacks = {}
	self.on_respawn_callbacks_once = {}
end

function _:add_on_respawn_callback(callback)
	table.insert(self.on_respawn_callbacks, callback)
end

function _:add_on_respawn_callback_once(callback)
	table.insert(self.on_respawn_callbacks_once, callback)
end

function _:call_respawn_callbacks()
	for _, f in ipairs(self.on_respawn_callbacks) do
		f(self)
	end
	for _, f in ipairs(self.on_respawn_callbacks_once) do
		f(self)
	end
	self.on_respawn_callbacks_once = {}
end

return _
