local drystal = require 'drystal'
local physic = require 'physic'

local PlayerCharacter = require 'PlayerCharacter'
local AICharacter = require 'AICharacter'
local CapturePoint = require 'CapturePoint'
local SpawnPoint = require 'SpawnPoint'
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

local blue_cap = create_entity(CapturePoint, colors.blue, -350, 0)
local neutral_cap = create_entity(CapturePoint, colors.neutral, 0, 0)
local red_cap = create_entity(CapturePoint, colors.red, 350, 0)

local sp_blue = create_entity(SpawnPoint, colors.blue, -500, 0)
local sp_red = create_entity(SpawnPoint, colors.red, 500, 0)

create_entity(AICharacter, sp_blue)
create_entity(AICharacter, sp_red)
create_entity(AICharacter, sp_red)

local width = 10
create_entity(Wall, -600, 0, width, 300*2)
create_entity(Wall, 600, 0, width, 300*2)
create_entity(Wall, 0, -300, 600*2, width)
create_entity(Wall, 0, 300, 600*2, width)

player = create_entity(PlayerCharacter, sp_blue)
player:remove_health(9.99)

