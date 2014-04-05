local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'
local ParticleSystem = require 'ParticleSystem'

local Bullet = class('Bullet', Entity)
:include('core.shape.Rectangle')

:include('core.health.Destroyable')
:include('core.health.Lifetimed')

:include('core.physic.Body')
:include('core.physic.Dynamic')
:include('core.physic.Callbacks')
:include('core.physic.DestroyCallback')
:include('core.physic.Fast')

:include('visual.Rectangle')

function Bullet:init(parent, x, y, angle, weapon)
	Entity.init(self, x, y)
	self.parent = parent

	self:init_rectangle(16, 8)

	self:init_visual_rectangle({250, 250, 250})

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

	self:init_lifetimed(self.type.lifetime)
	self:init_destroyable()
	self:init_physic_destroy_callback()

	self:add_begin_callback(function (self, other, x, y, normalx, normaly)
		if self.class == other.class then
			return
		end
		if other.has_health and not other.is_protected and not other.is_sensor then
			if other ~= parent then
				other:remove_health(self.type.damage * weapon.damage_factor)
			end
			self:destroy()
		elseif not other.is_sensor then
			self:destroy()
			local vx, vy = self.body:get_linear_velocity()
			local dot = normalx * vx + normaly * vy
			local reflectx = vx - 2 * dot * normalx
			local reflecty = vy - 2 * dot * normaly
			local angle = math.atan2(reflecty, reflectx)
			create_entity(ParticleSystem, x, y, angle)
		end
	end)
end

function Bullet:update(dt)
	Entity.update(self, dt)
	self:update_physic_dynamic(dt)
	self:update_lifetime(dt)
end

function Bullet:draw()
	self:draw_visual_rectangle()
end

function Bullet:collides_with(other)
	return self.parent ~= other and other.class ~= self.class
end

return Bullet

