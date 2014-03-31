local _ = {}

function _:init_lifetimed(lifetime)
	self.lifetime = lifetime
end

function _:update_lifetime(dt)
	if self.time > self.lifetime then
		self:destroy()
	end
end

return _

