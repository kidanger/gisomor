local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Camera = class('Camera', Entity)
:include(require 'Shaking')
:include(require 'Tracking')

function Camera:init()
	Entity.init(self, 0, 0)

	self:init_shaking()
	self:init_tracking(.2)

	self.zoom = 1
end

function Camera:update(dt)
	self:update_shaking(dt)
	if not self.track.dead then
		self:update_tracking(dt)
	end
end


function Camera:setup()
	drystal.camera.x = self.W / 2 - self.x
	drystal.camera.y = self.H / 2 - self.y
	drystal.camera.zoom = self.zoom
end

function Camera:zoom_out()
	self.zoom = self.zoom / 1.2
end

function Camera:zoom_in()
	self.zoom = self.zoom * 1.2
end

return Camera

