local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Character = class('Character', Entity)

:include('core.Colored')

:include('core.shape.Rectangle')

:include('core.health.Health')
:include('core.health.Regeneration')

:include('core.capture.CanCapture')

:include('core.spawn.Respawnable')
:include('core.spawn.Callbacks')
:include('core.spawn.HealthRespawnCallback')
:include('core.spawn.PhysicRespawnCallback')

:include('core.combat.weapon.Equipped')

:include('core.physic.Body')
:include('core.physic.Dynamic')
:include('core.physic.Controlled')

:include('visual.Rectangle')
:include('visual.HealthBar')

function Character:init(associated_base)
	local color = associated_base.color

	Entity.init(self, 0, 0)

	self:init_rectangle(40, 40)
	self:init_color(color)
	self:init_health(10)
	self:init_health_regeneration(1)
	self:init_respawnable(associated_base)
	self:init_respawn_callbacks()
	self:init_weapon_equipped()
	self:init_health_respawn_callback()
	self:init_physic_respawn_callback()

	self:init_visual_rectangle(color.visual_character)
	self:init_health_bar(60, 10, -self.h/2 - 8)

	self:init_physic_body({}, {
		angular_damping=6,
		linear_damping=15,
	})
	self:init_physic_control(20)

	self:add_on_respawn_callback(function() self.dead = false end)

	self.dead = true
	self.body:set_active(false)
	self:ask_respawn()
end

function Character:draw(x, y)
	if not self.dead then
		self:draw_visual_rectangle()
		self:draw_health_bar()

		if self.weapon then
			self.weapon:draw()
		end
	end
end

function Character:update(dt)
	if self.health == 0 and not self.dead then
		self:die()
	end
	if not self.dead then
		Entity.update(self, dt)
		self:update_physic_control(dt)
		self:update_physic_dynamic(dt)
		self:regenerate_health(dt)

		if self.weapon then
			self.weapon:update(dt)
		end
	end
end

function Character:die()
	self.dead = true
	self.body:set_active(false)
	self:ask_respawn()
end

return Character

