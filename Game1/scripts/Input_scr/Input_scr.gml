function input_scr()
{
    // Reset axis values in case no gamepad is connected
    global.haxis = 0;
    global.vaxis = 0;

    // Keyboard and mouse
    global.rk = keyboard_check(vk_right) || keyboard_check(ord("D"));
    global.lk = keyboard_check(vk_left) || keyboard_check(ord("A"));
    global.uk = keyboard_check(vk_up) || keyboard_check(ord("W"));
    global.dk = keyboard_check(vk_down) || keyboard_check(ord("S"));
    global.atk_k = mouse_check_button(mb_left) || keyboard_check(vk_space);

    // Gamepad additions (only if connected)
    if (gamepad_is_connected(0))
    {
        global.rk = global.rk || gamepad_button_check(0, gp_padr);
        global.lk = global.lk || gamepad_button_check(0, gp_padl);
        global.uk = global.uk || gamepad_button_check(0, gp_padu);
        global.dk = global.dk || gamepad_button_check(0, gp_padd);
        global.atk_k = global.atk_k || gamepad_button_check(0, gp_face1);

        // Optional: analog stick for smoother control
        global.haxis = gamepad_axis_value(0, gp_axislh);
        global.vaxis = gamepad_axis_value(0, gp_axislv);
    }
}