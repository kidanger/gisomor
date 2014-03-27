local drystal = require 'drystal'
local physic = require 'physic'

local Map = require 'Map'
local PlayerCharacter = require 'PlayerCharacter'
local PlayerControl = require 'PlayerCharacter'
local AICharacter = require 'AICharacter'
local Node = require 'Node'
local Camera = require 'Camera'
local colors = require 'colors'

local entities = {}
local player
local camera
local map

W, H = 800, 600
Camera.W = W
Camera.H = H
local zoom = drystal.camera.zoom
R = 32

function drystal.update(dt)
	for _, e in ipairs(entities) do
		e:update(dt)
	end
	physic.update(dt)

	local max = #entities
	for i, e in ipairs(entities) do
		if e.destroy_me then
			entities[i] = entities[max]
			entities[max] = nil
			e:on_destroy()
			max = max - 1
		end
	end
end

function drystal.draw()
	drystal.set_color(30, 30, 30)
	drystal.draw_background()

	camera:setup()
	for _, e in ipairs(entities) do
		e:draw()
	end
end

function drystal.key_press(k)
	if k == 'a' then
		drystal.stop()
	else
		player:key_press(k)
	end
end
function drystal.key_release(k)
	player:key_release(k)
end
function drystal.mouse_motion(x, y, dx, dy)
	player:mouse_motion(x, y, dx, dy)
end
function drystal.mouse_press(x, y, b)
	if b == 4 then
		camera:zoom_in()
	elseif b == 5 then
		camera:zoom_out()
	else
		player:mouse_press(x, y, b)
	end
end
function drystal.mouse_release(x, y, b)
	player:mouse_release(x, y, b)
end

function create_entity(cl, ...)
	local ent = cl:new(...)
	table.insert(entities, ent)
	return ent
end

local function begin_collide(body1, body2)
	local p1 = body1.parent
	local p2 = body2.parent
	if p1.begin_collide then
		p1:begin_collide(p2)
	end
	if p2.begin_collide then
		p2:begin_collide(p1)
	end
	return true
end

local function end_collide(body1, body2)
	local p1 = body1.parent
	local p2 = body2.parent
	if p1.end_collide then
		p1:end_collide(p2)
	end
	if p2.end_collide then
		p2:end_collide(p1)
	end
end

physic.create_world(0, 0)
physic.on_collision(begin_collide, end_collide)

drystal.resize(W, H)

camera = create_entity(Camera, player)

map = Map:new 'map1'

player = create_entity(PlayerCharacter, map:get_blue_base())
camera:track(player)

create_entity(AICharacter, map:get_blue_base())
create_entity(AICharacter, map:get_red_base())
create_entity(AICharacter, map:get_red_base())

