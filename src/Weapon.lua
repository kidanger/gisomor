local class = require 'class'

local Entity = require 'Entity'
local Bullet = require 'Bullet'

local Weapon = class('Weapon', Entity)

:include('core.Shaking')
:include('core.Tracking')

:include('core.shape.Rectangle')

:include 'core.combat.weapon.Cooldown'
:include('core.combat.weapon.Controlled')

:include('core.combat.ammo.Equipped')
:include('core.combat.ammo.Regeneration')

:include('visual.Rectangle')

function Weapon:init(owner, type)
	Entity.init(self, owner.x, owner.y)
	self.owner = owner
	self.type = type

	self:init_rectangle(40, 6)
	self:init_shaking()
	self:init_tracking(.6)
	self:track(owner)

	self:init_weapon_cooldown(type.cooldown)
	self:init_weapon_control()

	self:init_ammo(type.ammo_max)
	self:init_ammo_regeneration(type.ammo_regen_delay)

	self:init_visual_rectangle({50,50,50})

	self.angle = 0
end

function Weapon:fire()
	for i = 1, self.type.num_bullets do
		local spread = math.random() * self.type.spread - self.type.spread / 2
		local x = self.x + math.cos(self.angle + spread) * 40
		local y = self.y + math.sin(self.angle + spread) * 40
		create_entity(Bullet, self.owner, x, y, self.angle + spread, self.type)
	end

	self:consume_ammo(1)
	self:set_cooldown()
	self:shake(0.1)
end

function Weapon:draw()
	self:draw_visual_rectangle()
end

function Weapon:update(dt)
	Entity.update(self, dt)

	self:update_tracking(dt)
	self:update_shaking(dt)

	self:update_weapon_cooldown(dt)
	self:regenerate_ammo(dt)
	self:update_weapon_control(dt)
end

function Weapon:can_fire()
	return self.ammo > 0 and self:cooldown_is_down()
end

return Weapon

