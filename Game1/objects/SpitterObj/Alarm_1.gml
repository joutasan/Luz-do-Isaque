// Mouth offset
var mouth_offset_x = -30;
var mouth_offset_y = -6;
if (image_xscale < 0) mouth_offset_x = -mouth_offset_x;

// Create the spit and store its instance
var new_spit = instance_create_layer(x + mouth_offset_x, y + mouth_offset_y, "Spit", Spit);

// Flip the spit sprite based on Spitter facing
if (image_xscale < 0) {
    new_spit.image_xscale = -0.2;
} else {
    new_spit.image_xscale = 0.2;
}
