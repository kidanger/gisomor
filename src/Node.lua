local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local Node = class('Node', Entity)

:include('core.Colored')

:include('core.shape.Circle')

:include('core.capture.Linkable')
:include('core.capture.Capturable')

:include('core.capture.Points')
:include('core.capture.Regeneration')
:include('core.capture.LockDependsOnParents')

:include('core.physic.Body')
:include('core.physic.Callbacks')
:include('core.physic.CaptureCallback')
:include('core.physic.Sensor')

:include('visual.Node')
:include('visual.CaptureBar')

function Node:init(color, x, y, radius)
	Entity.init(self, x, y)

	self:init_color(color)
	self:init_linkable()
	self:init_capturable(4)
	self:init_circle(radius)
	self:init_points(10)
	self:init_points_regeneration(2)

	self:init_capture_bar(100, 20, 125 + 10)

	self:init_physic_body()
	self:init_physic_callbacks()
	self:init_physic_capture_callback()
end

function Node:draw(x, y)
	self:draw_visual_node()
	if self.points < self.maxpoints then
		self:draw_capture_bar()
	end
	--self:draw_links()
end

function Node:update(dt)
	Entity.update(self, dt)
	if not self.is_being_captured then
		self:regenerate_points(dt)
	end
	self:update_capturable(dt)
end

return Node

