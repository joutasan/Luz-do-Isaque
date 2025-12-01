function sprite_scr()
{
    // Attack overrides everything and is NOT flipped
    if (attacking) {
        sprite_index = MGAtk;
        image_xscale = 1;  // lock no flip
        image_speed = 1;   // ensure playback
        exit;
    }

    // Determine facing
    if (global.uk && !global.dk) facing = "up";
    else if (global.dk && !global.uk) facing = "down";
    else if (global.lk || global.rk) facing = "side";

    // State detection
    if (global.rk || global.lk || global.uk || global.dk)
        state = "walk";
    else
        state = "idle";

    // Sprite selection
    switch (state) {
        case "idle":
            if (facing == "up")        sprite_index = MGIdleBack;
            else if (facing == "down") sprite_index = MGIdleFront;
            else                       sprite_index = MGIdleSide;
        break;

        case "walk":
            if (facing == "up")        sprite_index = MGWalkBack;
            else if (facing == "down") sprite_index = MGWalkFront;
            else                       sprite_index = MGWalkSide;
        break;
    }

    // Flip ONLY side sprites
    if (facing == "side") {
        if (global.rk) image_xscale = 1;
        if (global.lk) image_xscale = -1;
    } else {
        image_xscale = 1;
    }
}
