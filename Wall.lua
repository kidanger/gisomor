local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Wall = class('Wall', Entity)

:include(require 'Rectangle')

:include(require 'VisualRectangle')

:include(require 'PhysicBody')


function Wall:init(x, y, w, h)
	Entity.init(self, x, y)

	self:init_rectangle(w, h)
	self:init_visual_rectangle({0, 0, 0})

	self:init_physic_body()
end

function Wall:draw(x, y)
	self:draw_visual_rectangle()
end

return Wall

