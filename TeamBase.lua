local class = require 'class'

local Entity = require 'Entity'

local TeamBase = class('TeamBase', Entity)
:include('core.Colored')
:include('core.shape.Rectangle')

:include('core.health.Health')
:include('core.health.Regeneration')

:include('core.capture.Linkable')
:include('core.capture.Protected')
:include('core.capture.NeverLocked')

:include('core.spawn.RespawnManager')

:include('core.physic.Body')

:include('visual.Base')
:include('visual.HealthBar')

function TeamBase:init(color, x, y)
	Entity.init(self, x, y)

	self:init_color(color)
	self:init_rectangle(200, 200)
	self:init_linkable()
	self:init_health(100)
	self:init_health_regeneration(0.05)
	self:init_respawn_manager()

	self:init_health_bar(100, 20, self.h/2)

	self:init_physic_body()
end

function TeamBase:update(dt)
	Entity.update(self, dt)
	self:update_respawn_manager(dt)
	self:regenerate_health(dt)
	self:update_protected(dt)
end

function TeamBase:draw()
	self:draw_visual_base()
	self:draw_health_bar()
	--self:draw_links()
end

return TeamBase

