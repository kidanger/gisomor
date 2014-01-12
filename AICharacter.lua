local drystal = require 'drystal'
local class = require 'class'

local Character = require 'Character'

local AICharacter = class('AICharacter', Character)
:include(require 'RandomAIControl')

function AICharacter:init(...)
	Character.init(self, ...)
	self:init_ai_control()
end

function AICharacter:update(dt)
	Character.update(self, dt)
	self:update_ai_control(dt)
end

function AICharacter:draw()
	Character.draw(self)
end

return AICharacter

