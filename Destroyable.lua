local _ = {}

function _:destroy()
	self.destroy_me = true
end

function _:on_destroy()
	if self.destroy_body then
		self:destroy_body()
	end
end

return _

