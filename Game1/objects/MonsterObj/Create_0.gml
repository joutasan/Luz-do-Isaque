hp = 20;
self.image_xscale = 0.5;
self.image_yscale = 0.5;
// Enemy Create Event (e.g., Bat)
depth = 0;
ai_pause = false
wander_timer = 0;
wander_dir = irandom(359); // random starting direction
wander_speed = 0.3;   // slower than chase speed (0.5)

// MonsterObj Create
drop_table = [
    [MonsterHeart, 0.5],
    [Coins, 0.6]
];