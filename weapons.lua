local bullets = {
    classic={
        damage=1,
        lifetime=200,
        speed=40,
    },
    shotgun={
        damage=2,
        lifetime=0.2,
        speed=40,
    },
}

local weapons = {
    gun={
        cooldown=0.2,
        ammo_max=10,
        ammo_regen_delay=0.2,
        spread=math.pi / 24,
        num_bullets=1,
        damage_factor=2,

        bullet=bullets.classic,
    },
    shotgun={
        cooldown=0.7,
        ammo_max=6,
        ammo_regen_delay=.4,
        spread=math.pi / 10,
        num_bullets=6,
        damage_factor=1,

        bullet=bullets.shotgun,
    },
    sniper={
        cooldown=1,
        ammo_max=3,
        ammo_regen_delay=1,
        spread=0,
        damage_factor=8,
        num_bullets=1,

        bullet=bullets.classic,
    },
}

return weapons

