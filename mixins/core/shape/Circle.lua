local drystal = require 'drystal'

local _ = {}

function _:init_circle(radius)
	self.radius = radius
end

function _:get_shape()
	return drystal.new_shape('circle', self.radius)
end

return _

