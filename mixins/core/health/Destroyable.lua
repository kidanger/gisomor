local _ = {}

function _:init_destroyable()
	self.on_destroy_callbacks = {}
end

function _:destroy()
	self.destroy_me = true
end

function _:add_on_destroy_callback(callback)
	table.insert(self.on_destroy_callbacks, callback)
end

function _:on_destroy()
	for _, f in ipairs(self.on_destroy_callbacks) do
		f(self)
	end
end

return _

