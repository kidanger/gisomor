local _ = {}

function _:init_physic_callbacks()
	self.begin_collide_callbacks = {}
	self.end_collide_callbacks = {}
end

function _:add_begin_callback(f)
	table.insert(self.begin_collide_callbacks, f)
end

function _:add_end_callback(f)
	table.insert(self.end_collide_callbacks, f)
end

function _:begin_collide(other, ...)
	for _, f in ipairs(self.begin_collide_callbacks) do
		f(self, other, ...)
	end
end

function _:end_collide(other, ...)
	for _, f in ipairs(self.end_collide_callbacks) do
		f(self, other, ...)
	end
end

return _
