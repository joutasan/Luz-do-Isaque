// Find the first Mugen instance
var mugen = instance_find(MugenObj, 0);

if (mugen != noone) {

    // Check if y positions are roughly equal and cooldown finished
    if (abs(y - mugen.y) < 1 && attack_cooldown <= 0) {

        // Attack sprite
        sprite_index = ReptileAtk;
        image_index = 0;
        image_speed = 0.5;

        // Set cooldown (in steps)
        attack_cooldown = room_speed * 0.5; // half-second cooldown

        // Flip based on Mugen position
        if (x > mugen.x) {
            image_xscale = 0.4; // facing left
        } else {
            image_xscale = -0.4; // facing right
        }

        // Create spit
        alarm[1] = 60
    }
}

// Decrement cooldown
if (attack_cooldown > 0) attack_cooldown -= 1;

// Reset sprite after attack animation finishes
if (sprite_index == ReptileAtk && image_index >= sprite_get_number(sprite_index) - 1) {
    sprite_index = ReptileAnim;
    image_speed = 1;
}
