local physic = require 'physic'

local _ = {}

function _:init_physic_body(shape_prop, body_prop)
	self.shape = self:get_shape()
	for k, v in pairs(shape_prop or {}) do
		local f = self.shape['set_' .. k]
		f(self.shape, v)
	end

	self.body = physic.new_body(self.is_dynamic, self.shape)
	self.body:set_position(self.x / R, self.y / R)
	for k, v in pairs(body_prop or {}) do
		local f = self.body['set_' .. k]
		f(self.body, v)
	end

	self.body.parent = self

	self.angle = self.body:get_angle()
end

function _:set_position(x, y)
	self.body:set_position(x/R, y/R)
	self.x = x
	self.y = y
end

return _

