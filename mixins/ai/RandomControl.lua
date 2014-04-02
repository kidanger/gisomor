local _ = {}

function _:init_ai_control()
end

function _:change(dir, dt)
	if math.random() < .8*dt then
		self[dir] = math.random() > .5
	end
end

function _:update_ai_control(dt)
	self:change('up', dt)
	self:change('left', dt)
	self:change('right', dt)
	self:change('down', dt)
end

return _

