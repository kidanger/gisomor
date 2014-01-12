local drystal = require 'drystal'
local physic = require 'physic'

local PlayerCharacter = require 'PlayerCharacter'
local AICharacter = require 'AICharacter'
local CapturePoint = require 'CapturePoint'
local TeamBase = require 'TeamBase'
local Wall = require 'Wall'
local colors = require 'colors'

local entities = {}
local player

local W, H = 600, 480
local zoom = drystal.camera.zoom
R = 32

function drystal.update(dt)
	dt = dt / 1000
	for _, e in ipairs(entities) do
		e:update(dt)
	end

	physic.update(dt)
end

function drystal.draw()
	drystal.set_color(30, 30, 30)
	drystal.draw_background()

	drystal.camera.x = W / 2 - player.x
	drystal.camera.y = H / 2 - player.y
	drystal.camera.zoom = zoom
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
function drystal.mouse_press(x, y, b)
	if b == 4 then
		zoom = zoom * 1.2
	elseif b == 5 then
		zoom = zoom * 0.8
	end
end

local function create_entity(cl, ...)
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

local base_blue = create_entity(TeamBase, colors.blue, -800, 0)
local base_red = create_entity(TeamBase, colors.red, 800, 0)

local p1 = create_entity(CapturePoint, colors.blue, -350, 0)
local p2 = create_entity(CapturePoint, colors.neutral, 0, -150)
local p2bis = create_entity(CapturePoint, colors.neutral, 0, 150)
local p3 = create_entity(CapturePoint, colors.red, 350, 0)

local function link_all(...)
	local nodes = {...}
	local old
	for _, n in ipairs(nodes) do
		if old then
			old:link(n, colors.red)
			n:link(old, colors.blue)
		end
		old = n
	end
end

link_all(base_blue, p1, p2, p3, base_red)
link_all(p1, p2bis, p3)

local width = 10
create_entity(Wall, -1000, 0, width, 300*2)
create_entity(Wall, 1000, 0, width, 300*2)
create_entity(Wall, 0, -300, 1000*2, width)
create_entity(Wall, 0, 300, 1000*2, width)

create_entity(AICharacter, base_blue)
create_entity(AICharacter, base_red)
create_entity(AICharacter, base_red)

player = create_entity(PlayerCharacter, base_blue)
player:remove_health(9.99)

