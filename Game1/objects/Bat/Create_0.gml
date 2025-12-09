hp = 10;
self.image_xscale = 0.3;
self.image_yscale = 0.3;
// Enemy Create Event (e.g., Bat)
depth = -100;
ai_pause = false
wander_timer = 0;
wander_dir = irandom(359); // random starting direction
wander_speed = 0.3;   // slower than chase speed (0.5)

// BatObj Create
drop_table = [
    [BatWing, 0.5],
    [Coins, 0.6]
];