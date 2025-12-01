function update_scale(){
var mon_w = display_get_width();
var mon_h = display_get_height();

// Find best integer scale that fits screen
var scale = max(1, floor(min(mon_w / base_w, mon_h / base_h)));

// Window size we want
var target_w = base_w * scale;
var target_h = base_h * scale;

// Apply window size (works both windowed and after switching fullscreen)
window_set_size(target_w, target_h);

// Ensure camera uses internal resolution (camera 0)
if (array_length(view_camera) > 0 && view_enabled) {
    var cam = view_camera[0];
    if (is_undefined(cam) == false) {
        camera_set_view_size(cam, base_w, base_h);
    }
}

// Make the viewport cover the whole window
view_wport[0] = window_get_width();
view_hport[0] = window_get_height();

}