// Kill enemy if its HP reaches zero
if (hp <= 0)
{
    drop_items();  // Spawn drops here
	instance_destroy();
    exit;
}

// --- If player is dead → wander randomly ---
if (!instance_exists(MugenObj)) {
    
    // Pick a new direction every 30-90 frames
    if (wander_timer <= 0) {
        wander_dir = irandom(359);
        wander_timer = irandom_range(30, 90);
    }

    wander_timer--;

    // Move slowly in the wandering direction
    var nx = x + lengthdir_x(wander_speed, wander_dir);
    var ny = y + lengthdir_y(wander_speed, wander_dir);

    // Collision-safe wandering
    if (!place_meeting(nx, y, wall)) x = nx;
    if (!place_meeting(x, ny, wall)) y = ny;

    exit; // done for this step
}


// --- Player is alive → normal bat chase/attack AI ---

// distance to player
var dist = point_distance(x, y, MugenObj.x, MugenObj.y);

// If AI is paused (attack cooldown), do nothing
if (ai_pause) exit;

// If far away → move toward player normally
if (dist > 8)
{
    mp_potential_step_object(MugenObj.x, MugenObj.y, 0.5, obj_Obstacle);
;
}
else
{
    ai_pause = true;
    alarm[0] = 30;
}