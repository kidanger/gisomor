local physic = require 'physic'

local _ = {}

function _:init_circle(radius)
	self.radius = radius
end

function _:get_shape()
	return physic.new_shape('circle', self.radius / R)
end

return _

