// Create Event
base_w = 432;
base_h = 240;

gpu_set_texfilter(false);

// Keep GUI matching the base resolution
display_set_gui_maximise(base_w, base_h);

// First-time scale
update_scale();
