/// obj_GameController Draw Event

if (demo_finished)
{
    // Fade-in effect
    alpha = min(alpha + 0.02, 1);
    draw_set_alpha(alpha);

    // Center sprite in room
    var cx = room_width / 2 - sprite_width / 2;
    var cy = room_height / 2 - sprite_height / 2;

    draw_sprite(congrats_sprite, 0, cx, cy);

    // Reset alpha
    draw_set_alpha(1);
}
