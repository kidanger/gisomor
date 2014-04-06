local drystal = require 'drystal'
local class = require 'class'

local Entity = require 'Entity'

local WeaponType = class('WeaponType')

function WeaponType:init(data)
	for k, v in pairs(data) do
		self[k] = v
	end
end

return WeaponType

