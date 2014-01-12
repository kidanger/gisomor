local physic = require 'physic'

local _ = {}

function _:init_rectangle(w, h)
	self.w = w
	self.h = h
end

function _:get_shape()
	return physic.new_shape('box', self.w / R, self.h / R)
end

return _
