/// MUSIC CONTROLLER

var room_name = room_get_name(room);

// --------------------
// SELECT MUSIC
// --------------------

// Scene: Menu
if (room_name == "Menu" || room_name == "Warn" || room_name == "IntroRoom" || room_name == "CntrlRoom")
{
    if (current_song != MenuST) {
        audio_stop_all();
        audio_play_sound(MenuST, 1, true);
        current_song = MenuST;

        loop_point = 13; // custom loop point
        song_start_time = current_time / 1000;
    }
}

// Scene: Sala1 (Fight)
else if (room_name == "Sala1") {
    if (current_song != BossST) {
        audio_stop_all();
        audio_play_sound(BossST, 1, true);
        current_song = BossST;

        loop_point = 18; // custom loop point
        song_start_time = current_time / 1000;
    }
}


// --------------------
// HANDLE LOOPING
// --------------------
if (current_song != noone)
{
    var elapsed = current_time/1000 - song_start_time;

    if (elapsed >= loop_point)
    {
        audio_stop_sound(current_song);
        audio_play_sound(current_song, 1, true);
        song_start_time = current_time / 1000;
    }
}