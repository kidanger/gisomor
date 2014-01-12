local _ = {}

function _:path_is_locked(tocolor)
	for _, n in ipairs(self.nodes[tocolor]) do
		if n.color == tocolor and not n:path_is_locked(tocolor) then
			return false
		end
	end

	return true
end

return _

