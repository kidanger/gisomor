local _ = {}

function _:init_respawner(time)
	self.time_between_respawns = time
	self.respawn_timer = 0
end

function _:respawn_is_available()
	return self.respawn_timer == 0
end

function _:respawn(entity)
	self.respawn_timer = self.time_between_respawns
	entity:on_respawn(self)
end

function _:update_respawner(dt)
	if self.respawn_timer > 0 then
		self.respawn_timer = self.respawn_timer - dt
		if self.respawn_timer < 0 then
			self.respawn_timer = 0
		end
	end
end

return _

