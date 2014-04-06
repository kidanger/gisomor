local class = require 'class'

local Entity = class('Entity')

function Entity:init(x, y)
	self.x = x
	self.y = y
	self.tick = 0
	self.time = 0
end

function Entity:update(dt)
	self.tick = self.tick + 1
	self.time = self.time + dt
end

function Entity:draw() end

return Entity
