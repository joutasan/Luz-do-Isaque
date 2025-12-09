function take_damage(amount)
{
    // Ignore if invincible or already dead
    if (invincibility > 0 || dead) return;

    hp -= amount;

    // Update hearts ONLY if not dead yet
    var h = instance_find(HeartCount, 0);

    if (hp > 0) {
        if (h != noone) {
            h.image_index += amount;
        }
    }

    invincibility = max_invincibility;

    // ----- DEATH -----
    if (hp <= 1)
    {
        dead = true;

        // Lock hearts to empty bar (image index 9)
        if (h != noone) {
            h.image_index = 9;
        }

        sprite_index = MGDeath;
        image_speed = 0.1;

        alarm[2] = 300;
        exit;
    }
}
