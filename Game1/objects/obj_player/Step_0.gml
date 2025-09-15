if (keyboard_check(vk_up))
{
	sprite_index = spr_player_back_walking
	image_speed = 0.5;
}
if (keyboard_check(vk_down))
{
	sprite_index = spr_player_walk
	image_speed = 0.5;
}
if (keyboard_check(vk_right))
{
	sprite_index = spr_player_walk
	image_xscale = 1;
	image_speed = 0.5;
}
if (keyboard_check(vk_left))
{
	sprite_index = spr_player_walk
	image_xscale = -1;
	image_speed = 0.5;
}
if(!keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right))
{
	sprite_index = spr_player_idle
}