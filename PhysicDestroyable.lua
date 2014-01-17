local _ = {}

function _:destroy_body()
	self.body:destroy()
	self.body = nil
end

return _

