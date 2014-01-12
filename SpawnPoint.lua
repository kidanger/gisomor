local class = require 'class'

local Entity = require 'Entity'

local SpawnPoint = class('SpawnPoint', Entity)
:include(require 'Colored')

--for debug
:include(require 'Circle')
:include(require 'VisualCircle')


function SpawnPoint:init(color, x, y)
	Entity.init(self, x, y)

	self:init_color(color)
	--for debug
	self:init_circle(10)
	self:init_visual_circle({0, 0, 0})
end

function SpawnPoint:update(dt)
end

function SpawnPoint:draw()
	--for debug
	self:draw_visual_circle()
end

return SpawnPoint
