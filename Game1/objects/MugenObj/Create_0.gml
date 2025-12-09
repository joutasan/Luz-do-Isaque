// MugenObj Create Event
hp = 10;       // current health
max_hp = 10;   // maximum health
spd = 0;

depth = -50;  // draw on top of enemies (depth 0)


facing = "down"; // "up", "down", "side"
state = "idle"; // "idle", "walk", "attack"
dead = false;

canAttack = true;     // can I start an attack?
attacking = false;    // am I currently attacking?
attack_cd = 55;       // frames between attacks

invincibility = 0;    // frames of invulnerablility left
max_invincibility = 30; // how long player blinks after hit
