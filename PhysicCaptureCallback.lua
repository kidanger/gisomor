local _ = {}

function _:init_physic_capture_callback()
	self:add_begin_callback(function (self, other)
		if other.class.name == 'Character' then
			self:begin_capture(other)
		end
	end)
	self:add_end_callback(function (self, other)
		if other.class.name == 'Character' then
			self:end_capture(other)
		end
	end)
end

return _

