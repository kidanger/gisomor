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

function Bullet:init(parent, x, y, angle)
	Entity.init(self, x, y)
	self.parent = parent

	self:init_rectangle(16, 8)

	self:init_visual_rectangle({0, 0, 0})

	local speed = 20
	self:init_physic_body({
		restitution=1,
	}, {
		angle=angle,
		linear_velocity={math.cos(angle)*speed, math.sin(angle)*speed},
		linear_damping=0,
		bullet=true,
	})
	self:init_physic_callbacks()

	self.is_bullet = true
	self:add_begin_callback(function (self, other)
		if other ~= parent and not other.is_bullet then
			if other.has_health then
				other:remove_health(1)
				self:destroy()
			elseif not other.is_sensor then
				self:destroy()
			end
		end
	end)
end

function Bullet:update(dt)
	self:update_physic_dynamic()
end

function Bullet:draw()
	self:draw_visual_rectangle()
end

return Bullet

