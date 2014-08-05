local drystal = require 'drystal'

local _ = {}

function _:init_physic_body(shape_prop, body_prop)
	self.shape = self:get_shape()
	self.shape:set_sensor(self.is_sensor or false)

	for k, v in pairs(shape_prop or {}) do
		local f = self.shape['set_' .. k]
		f(self.shape, v)
	end

	self.body = drystal.new_body(self.is_dynamic, self.x, self.y, self.shape)
	self.body:set_bullet(self.is_fast or false)
	for k, v in pairs(body_prop or {}) do
		local f = self.body['set_' .. k]
		if type(v) == 'table' then
			f(self.body, unpack(v))
		else
			f(self.body, v)
		end
	end

	self.body.parent = self

	self.angle = self.body:get_angle()
end

function _:set_position(x, y)
	self.body:set_position(x, y)
	self.x = x
	self.y = y
end

function _:set_angle(angle)
	self.body:set_angle(angle)
	self.angle = angle
end

return _

