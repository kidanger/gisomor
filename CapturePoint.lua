local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local CapturePoint = class('CapturePoint', Entity)

:include(require 'Colored')
:include(require 'Linkable')
:include(require 'Capturable')
:include(require 'Circle')
:include(require 'Points')
:include(require 'PointsRegeneration')
:include(require 'LockDependsOnParents')

:include(require 'VisualCapturePoint')
:include(require 'CaptureBar')

:include(require 'PhysicBody')
:include(require 'PhysicCallbacks')
:include(require 'PhysicCaptureCallback')

function CapturePoint:init(color, x, y)
	Entity.init(self, x, y)

	self:init_color(color)
	self:init_linkable()
	self:init_capturable(3.0)
	self:init_circle(125)
	self:init_points(10)
	self:init_points_regeneration(7)

	self:init_capture_bar(100, 20, 125 + 10)

	self:init_physic_body({sensor=true})
	self:init_physic_callbacks()
	self:init_physic_capture_callback()
end

function CapturePoint:draw(x, y)
	self:draw_visual_capture_point()
	if self.points < self.maxpoints then
		self:draw_capture_bar()
	end
	--debug
	self:draw_links()
end

function CapturePoint:update(dt)
	Entity.update(self, dt)
	if not self.is_being_captured then
		self:regenerate_points(dt)
	end
	self:update_capturable(dt)
end

return CapturePoint

