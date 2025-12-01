/// Step Event

// Toggle fullscreen: F11 or Alt+Enter
if (keyboard_check_pressed(vk_f11) || (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)))
{
    // Toggle fullscreen
    var fs = window_get_fullscreen();
    window_set_fullscreen(!fs);

    // Immediately re-scale for the new mode
    update_scale();

    // Optional debug print
    show_debug_message("Fullscreen now: " + string(window_get_fullscreen()));
    show_debug_message("Window size: " + string(window_get_width()) + "x" + string(window_get_height()));
}
