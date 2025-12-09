var mouth_offset_x = 30 * attack_dir;
var mouth_offset_y = -6;

var new_spit = instance_create_layer(x + mouth_offset_x, y + mouth_offset_y, "Spit", Spit);

// Flip spit
new_spit.image_xscale = 0.2 * attack_dir;
new_spit.image_yscale = 0.3

// Move spit
new_spit.hspeed = 2 * attack_dir;
