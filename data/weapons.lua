local bullets = require 'data.bullets'

local WeaponType = require 'WeaponType'

local weapons = {}

weapons.gun = WeaponType:new {
    cooldown=0.2,
    ammo_max=10,
    ammo_regen_delay=0.2,
    spread=math.pi / 24,
    num_bullets=1,
    damage_factor=2,

    bullet_type=bullets.classic,
}

weapons.shotgun = WeaponType:new {
    cooldown=0.7,
    ammo_max=6,
    ammo_regen_delay=.4,
    spread=math.pi / 10,
    num_bullets=6,
    damage_factor=1,

    bullet_type=bullets.shotgun,
}

weapons.sniper = WeaponType:new {
    cooldown=1,
    ammo_max=3,
    ammo_regen_delay=1,
    spread=0,
    damage_factor=8,
    num_bullets=1,

    bullet_type=bullets.classic,
}

return weapons

