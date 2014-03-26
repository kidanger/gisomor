local class = require 'class'

local TiledMapLoader = require 'TiledMapLoader'
local colors = require 'colors'

local TeamBase = require 'TeamBase'
local Wall = require 'Wall'
local Node = require 'Node'

local Map = class('Map')

function Map:init(name)
	self.bases = {}

	TiledMapLoader:new():load(self, 'maps/' .. name)
end

function Map:add_base(color, x, y)
	assert(self.bases[color] == nil)
	self.bases[color] = create_entity(TeamBase, color, x, y)
	return self.bases[color]
end

function Map:add_wall(x, y, w, h)
	local w = create_entity(Wall, x, y, w, h)
	return w
end

function Map:add_node(color, x, y, radius)
	local n = create_entity(Node, color, x, y, radius)
	return n
end

function Map:link(obj1, obj2, color)
	obj1:link(obj2, color)
end

function Map:get_blue_base()
	return self.bases[colors.blue]
end
function Map:get_red_base()
	return self.bases[colors.red]
end

return Map

