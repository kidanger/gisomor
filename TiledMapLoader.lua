local class = require 'class'

local MapLoader = require 'MapLoader'
local colors = require 'colors'

local TiledMapLoader = class('TiledMapLoader', MapLoader)

function TiledMapLoader:init()
end

function TiledMapLoader:load(map, filename)
	local data = require(filename)
	for _, layer in ipairs(data.layers) do
		for _, obj in ipairs(layer.objects) do
			TiledMapLoader:add_object(map, obj)
		end
		-- link up
		for _, obj in ipairs(layer.objects) do
			for _, target in ipairs(obj.links) do
				local found = false
				for _, obj2 in ipairs(layer.objects) do
					if target.name == obj2.name then
						print(obj.name, 'to', obj2.name)
						map:link(obj.created, obj2.created, target.color)
						found = true
					end
				end
				assert(found, "link to " .. target.name .. " is impossible from " .. obj.name)
			end
		end
		-- add respawners
		for _, obj in ipairs(layer.objects) do
			if obj.type == 'spawn' then
				map:active_spawn(obj.created)
			end
		end
	end
end

function TiledMapLoader:add_object(map, obj)
	obj.links = {}
	local color = obj.properties.color ~= nil and colors[obj.properties.color]

	local e
	if obj.type == 'base' then
		e = map:add_base(color, obj.x + obj.width / 2, obj.y + obj.height / 2)
	elseif obj.type == 'node' then
		e = map:add_node(color, obj.x + obj.width / 2, obj.y + obj.height / 2, obj.width / 2)
	elseif obj.type == 'wall' then
		e = map:add_wall(obj.x + obj.width / 2, obj.y + obj.height / 2, obj.width, obj.height)
	elseif obj.type == 'spawn' then
		e = map:add_spawn(color, obj.x + obj.width / 2, obj.y + obj.height / 2)
	end
	obj.created = e

	local i = 1
	while obj.properties['link' .. i] do
		local name = obj.properties['link' .. i]
		local colorname = obj.properties['link' .. i .. 'color']
		local color = colors[colorname]
		assert(color, "invalid color name: " .. colorname)
		table.insert(obj.links, {name=name, color=color})
		i = i + 1
	end
end


return TiledMapLoader

