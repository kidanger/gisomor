local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Character = class('Character', Entity)

:include(require 'Rectangle')
:include(require 'Colored')
:include(require 'Health')
:include(require 'HealthRegeneration')
:include(require 'HealthRespawnCallback')
:include(require 'CanCapture')
:include(require 'Spawnable')

:include(require 'VisualRectangle')
:include(require 'HealthBar')

:include(require 'PhysicBody')
:include(require 'PhysicControl')
:include(require 'PhysicDynamic')

function Character:init(associated_base)
	local color = associated_base.color

	Entity.init(self, 0, 9)

	self:init_rectangle(40, 40)
	self:init_color(color)
	self:init_health(10)
	self:init_health_regeneration(3.14)
	self:init_respawnable(associated_base)
	self:init_health_respawn_callback()

	self:init_visual_rectangle(color.visual_character)
	self:init_health_bar(60, 10, -self.h/2 - 8)

	self:init_physic_body({}, {
		angular_damping=6,
		linear_damping=15,
	})
	self:init_physic_control(20)

	self:die()
end

function Character:draw(x, y)
	if not self.dead then
		self:draw_visual_rectangle()
		self:draw_health_bar()
	end
end

function Character:update(dt)
	if self.health == 0 then
		self:die()
	end
	if not self.dead then
		Entity.update(self, dt)
		self:update_physic_control(dt)
		self:update_physic_dynamic(dt)
		self:regenerate_health(dt)
	end
end

function Character:die()
	self.dead = true
	self:ask_respawn()
end

return Character

