Movement();        // move the player
sprite_scr();      // update animations

// Handle invincibility timer + flicker
if (invincibility > 0) {

    invincibility--;

    // Slow flicker (visible 6 frames, invisible 6 frames)
    if (invincibility mod 12 < 6) {
        image_alpha = 0.4;
    } else {
        image_alpha = 1;
    }

} else {
    image_alpha = 1;
}
