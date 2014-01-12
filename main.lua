local drystal = require 'drystal'
local physic = require 'physic'

local Character = require 'Character'
local CapturePoint = require 'CapturePoint'
local colors = require 'colors'

local entities = {}
local player

local W, H = 600, 480
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

function drystal.init()
	physic.create_world(0, 0)
	physic.on_collision(begin_collide, end_collide)

	drystal.resize(W, H)

	create_entity(CapturePoint, colors.neutral, 400, 300)

	create_entity(Character, colors.red, 300, 250)
	create_entity(Character, colors.red, 300, 450)
	create_entity(Character, colors.blue, 100, 250)

	player = create_entity(Character, colors.blue, 100, 150)
	player:remove_health(9.99)
end

