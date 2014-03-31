local drystal = require 'drystal'
local particle = require 'particle'
local class = require 'class'

local Entity = require 'Entity'

local ParticleSystem = class('ParticleSystem', Entity)
:include(require 'Destroyable')
:include(require 'Lifetimed')

function ParticleSystem:init(x, y, angle)
	Entity.init(self, x, y)

	self:init_lifetimed(1)
	self:init_destroyable()

	self.system = particle.new_system(self.x, self.y)
	self.system:add_size(0, 8)
	self.system:add_size(1, 0)
	self.system:set_lifetime(1)

	self.system:set_initial_velocity(80, 120)
	self.system:set_initial_acceleration(-120)

	for i = 1, 20 do
		self.system:emit()
	end
end

function ParticleSystem:update(dt)
	Entity.update(self, dt)
	self:update_lifetime(dt)
	self.system:update(dt)
end

function ParticleSystem:draw()
	self.system:draw()
end

return ParticleSystem

