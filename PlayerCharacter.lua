local class = require 'class'

local Character = require 'Character'

local PlayerCharacter = class('PlayerCharacter', Character)

:include('player.KeyboardControl')
:include('player.MouseControl')

return PlayerCharacter

