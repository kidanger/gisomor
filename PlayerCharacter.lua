local class = require 'class'

local Character = require 'Character'

local PlayerCharacter = class('PlayerCharacter', Character)
:include(require 'PlayerControl')

return PlayerCharacter

