local class = require 'class'

local Entity = require 'Entity'

local TeamBase = class('TeamBase', Entity)
:include(require 'Colored')
:include(require 'Linkable')
:include(require 'Rectangle')
:include(require 'Health')
:include(require 'HealthRegeneration')
:include(require 'NeverLocked')

:include(require 'VisualRectangle')
:include(require 'HealthBar')

:include(require 'PhysicBody')

function TeamBase:init(color, x, y)
	Entity.init(self, x, y)

	self:init_color(color)
	self:init_rectangle(200, 200)
	self:init_linkable()
	self:init_health(100)
	self:init_health_regeneration(0.001)

	self:init_visual_rectangle(color.visual_base)
	self:init_health_bar(100, 20, self.h/2)

	self:init_physic_body({sensor=true})
	self.is_base = true
end

function TeamBase:update(dt)
end

function TeamBase:draw()
	self:draw_visual_rectangle()
	self:draw_health_bar()
	--debug
	self:draw_links()
end

return TeamBase

