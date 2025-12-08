function Movement() {

    input_scr(); // Get fresh input FIRST
    
    var spd = 2; // Base speed

    // Movement penalty WHILE attacking
    if (attacking) {
        spd *= 0.4; // 40% speed while spinning (tweak if needed)
    }

    // Diagonal penalty AFTER attack scaling (so slowdown applies properly)
    if ( (global.uk && global.lk) ||
         (global.uk && global.rk) ||
         (global.dk && global.lk) ||
         (global.dk && global.rk) )
    {
        spd *= 0.66; // instead of hard 2, scale proportionally
        // or use spd = 2 if you want fixed diagonal speed
    }

    // Reset movement variables
    hspd = 0;
    vspd = 0;

    // Horizontal input
    if (global.rk) {
        hspd = spd;
        image_xscale = -1;
        direcao = 1;
    }
    if (global.lk) {
        hspd = -spd;
        image_xscale = 1;
        direcao = 0;
    }

    // Vertical input
    if (global.uk) vspd = -spd;
    if (global.dk) vspd = spd;


    // =============================
    // ATTACK TRIGGER (unchanged)
    // =============================
    if (global.atk_k && canAttack) {
        attacking = true;
        canAttack = false;
		instance_create_layer(MugenObj.x,MugenObj.y,"Hitbox",SwordHit);
        sprite_index = MGAtk;
        image_index = 0;
        image_speed = 0.3; // slower spin attack animation speed
        alarm[0] = 55; 
        // sync alarm to animation duration
    }
	if (MugenObj.attacking == true)
	{
		SwordHit.x = MugenObj.x
		SwordHit.y = MugenObj.y
	}



    // --- COLLISION SYSTEM ---

    // Horizontal collision
    if (place_meeting(x + hspd, y, wall)) {
        while (!place_meeting(x + sign(hspd), y, wall)) {
            x += sign(hspd);
        }
        hspd = 0;
    }

    // Vertical collision
    if (place_meeting(x, y + vspd, wall)) {
        while (!place_meeting(x, y + sign(vspd), wall)) {
            y += sign(vspd);
        }
        vspd = 0;
    }

    // Apply movement
    x += hspd;
    y += vspd;
}
