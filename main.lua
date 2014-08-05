local drystal = require 'drystal'

package.path = package.path .. ';src/?.lua'
package.path = package.path .. ';lib/?.lua'

local Map = require 'Map'
local PlayerCharacter = require 'PlayerCharacter'
local PlayerControl = require 'PlayerCharacter'
local AICharacter = require 'AICharacter'
local Node = require 'Node'
local Camera = require 'Camera'
local weapons = require 'data.weapons'

local entities = {}
local player
local camera
local map

W, H = 800, 600
Camera.W = W
Camera.H = H

function drystal.update(dt)
	for _, e in ipairs(entities) do
		e:update(dt)
	end
	drystal.update_physic(dt)

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

	drystal.camera:reset()
	for j, w in pairs(player.weapons) do
		if player.weapon == w then
			drystal.set_color(100, 0, 0)
		else
			drystal.set_color(0, 0, 0)
		end
		for i = 1, w.ammo do
			drystal.draw_rect(i * 10, j * 15, 5, 10)
		end
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

local function begin_collide(body1, body2, x, y, normalx, normaly)
	local p1 = body1.parent
	local p2 = body2.parent
	if p1.begin_collide then
		p1:begin_collide(p2, x, y, normalx, normaly)
	end
	if p2.begin_collide then
		p2:begin_collide(p1, x, y, -normalx, -normaly)
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

local function presolve(body1, body2)
	local p1 = body1.parent
	local p2 = body2.parent
	if p1.collides_with and not p1:collides_with(p2) then
		return false
	end
	if p2.collides_with and not p2:collides_with(p1) then
		return false
	end
	return true
end

drystal.create_world(0, 0, 32)
drystal.on_collision(begin_collide, end_collide, presolve)

drystal.resize(W, H)

camera = create_entity(Camera, player)

map = Map:new 'map1'

player = create_entity(PlayerCharacter, map:get_blue_base())
player:give_weapon(weapons.gun)
player:give_weapon(weapons.sniper)
player:give_weapon(weapons.shotgun)
camera:track(player)

create_entity(AICharacter, map:get_blue_base())
create_entity(AICharacter, map:get_red_base())
create_entity(AICharacter, map:get_red_base())

function drystal.prereload()
	_X, _Y = player.x, player.y
	_Z = camera.zoom
end

function drystal.postreload()
	camera.targetzoom = _Z
	camera.zoom = _Z * 1.2
	player:add_on_respawn_callback_once(function()
		player:set_position(_X, _Y)
		camera.x = player.x
		camera.y = player.y
	end)
end

