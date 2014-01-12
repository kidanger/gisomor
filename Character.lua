local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Character = class('Character', Entity)

:include(require 'Rectangle')
:include(require 'Colored')
:include(require 'Health')
:include(require 'HealthRegeneration')
:include(require 'CanCapture')

:include(require 'VisualRectangle')
:include(require 'HealthBar')

:include(require 'PhysicBody')
:include(require 'PhysicControl')
:include(require 'PhysicDynamic')

function Character:init(associated_spawn_point)
	local x, y = associated_spawn_point.x, associated_spawn_point.y
	local color = associated_spawn_point.color

	Entity.init(self, x, y)

	self:init_rectangle(40, 40)
	self:init_color(color)
	self:init_health(10)
	self:init_health_regeneration(3.14)

	self:init_visual_rectangle(color.visual)
	self:init_health_bar(60, 10, -self.h/2 - 8)

	self:init_physic_body({}, {
		angular_damping=6,
		linear_damping=15,
	})
	self:init_physic_control(20)
end

function Character:draw(x, y)
	self:draw_visual_rectangle()
	self:draw_health_bar()
end

function Character:update(dt)
	Entity.update(self, dt)
	self:update_physic_control(dt)
	self:update_physic_dynamic(dt)
	self:regenerate_health(dt)
end

return Character

