hp = 15
attack_cooldown = 0;
attack_dir = 1; // 1 = right, -1 = left
attacking = false;
// Enemy Create Event (e.g., Bat)
depth = 0;
flip_lock = 0;   // frames until he is allowed to flip again
face_dir = 1; // 1 = right, -1 = left (FOR IDLE ONLY)

// ReptileObj Create
drop_table = [
    [ReptileTail, 0.2],
    [Coins, 0.8]
];