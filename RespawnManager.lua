local _ = {}

function _:init_respawn_manager(respawners)
	self.respawners = respawners
	self.respawn_list = {}
end

function _:add_to_respawn_list(entity)
	table.insert(self.respawn_list, entity)
end

function _:update_respawn_manager(dt)
	for i, e in ipairs(self.respawn_list) do
		for _, r in ipairs(self.respawners) do
			if r:respawn_is_available() then
				r:respawn(e)
				table.remove(self.respawn_list, i)
			end
		end
	end
end

return _

