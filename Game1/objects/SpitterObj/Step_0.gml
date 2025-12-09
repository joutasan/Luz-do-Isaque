// Kill enemy if its HP reaches zero
if (hp <= 0)
{
    drop_items();  // Spawn drops here
	instance_destroy();
    exit;
}


var mugen = instance_find(MugenObj, 0);

// --------- IDLE FACING LOGIC ---------
if (!attacking && flip_lock <= 0 && mugen != noone) {
    if (x > mugen.x) face_dir = 1;
    else face_dir = -1;
}


// --------- ATTACK LOGIC ---------
if (mugen != noone) {

    // Check if aligned and cooldown finished
    if (abs(y - mugen.y) < 1 && attack_cooldown <= 0) {

        // Lock into attacking state
        attacking = true;

        // Enter attack animation
        sprite_index = ReptileAtk;
        image_index = 0;
        image_speed = 0.5;

        // Lock the direction for this attack
        if (x > mugen.x) {
            attack_dir = -1;
        } else {
            attack_dir = 1;
        }

        // Cooldown + delayed spit
        attack_cooldown = room_speed * 0.5;
        alarm[1] = 60;
    }
}

// Reduce cooldown
if (attack_cooldown > 0) attack_cooldown--;

// When attack animation ends → return to idle
if (attacking && sprite_index == ReptileAtk && image_index >= sprite_get_number(sprite_index) - 1) {
    sprite_index = ReptileAnim;
    image_speed = 1;
    attacking = false;

    flip_lock = 50; // prevent flipping for 50 frames
}

if (flip_lock > 0) flip_lock--;
