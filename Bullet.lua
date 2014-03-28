local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Bullet = class('Bullet', Entity)
:include(require 'Rectangle')
:include(require 'Destroyable')

:include(require 'VisualRectangle')

:include(require 'PhysicBody')
:include(require 'PhysicDynamic')
:include(require 'PhysicCallbacks')
:include(require 'PhysicDestroyable')
:include(require 'IsSensor')

function Bullet:init(parent, x, y, angle, weapon)
	Entity.init(self, x, y)
	self.parent = parent

	self:init_rectangle(16, 8)

	self:init_visual_rectangle({0, 0, 0})

	self.type = weapon.bullet
	local speed = self.type.speed
	self:init_physic_body({
		restitution=1,
	}, {
		angle=angle,
		linear_velocity={math.cos(angle)*speed, math.sin(angle)*speed},
		linear_damping=0,
		bullet=true,
	})
	self:init_physic_callbacks()

	self:add_begin_callback(function (self, other)
		if other.has_health and not other.is_protected and not other.is_sensor then
			if other ~= parent then
				other:remove_health(self.type.damage * weapon.damage_factor)
			end
			self:destroy()
		elseif not other.is_sensor then
			self:destroy()
		end
	end)
end

function Bullet:update(dt)
	Entity.update(self, dt)
	self:update_physic_dynamic()
	if self.time >= self.type.lifetime then
		self:destroy()
	end
end

function Bullet:draw()
	self:draw_visual_rectangle()
end

return Bullet

