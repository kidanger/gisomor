local _ = {}

function _:path_is_locked(tocolor)
	if self.color == tocolor then
		return false
	end
	return true
end

return _

