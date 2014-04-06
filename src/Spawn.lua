local class = require 'class'

local Entity = require 'Entity'

local Spawn = class('Spawn', Entity)

:include('core.Colored')

:include('core.shape.Circle')

:include('core.spawn.Respawner')

:include('visual.Circle')

function Spawn:init(color, x, y)
	Entity.init(self, x, y)

	self:init_color(color)
	self:init_circle(40)
	self:init_respawner(2.5)

	self:init_visual_circle(color.visual_base)
end

function Spawn:update(dt)
	self:update_respawner(dt)
end

function Spawn:draw()
	self:draw_visual_circle()
end

return Spawn

