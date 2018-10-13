/// @description Options Menu GUI

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width - 512;
menu_y = gui_height - 192;

//menu_speed = 25;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[4] = "Off";
menu[3] = "On";
menu[2] = "Off";
menu[1] = "On";
menu[0] = "Back";

label[2] = "Volume";
label[1] = "Music";
label[0] = "Game";

label_items = array_length_1d(label);
menu_items = array_length_1d(menu);

menu_cursor = 4;

menu_top = menu_y - menu_itemheight * 1.5 * menu_items;

game_volume = global.vol_gam;
music_volume = global.vol_mus;

game_height = menu_y - menu_itemheight * 1.5 * 13;
music_height = menu_y - menu_itemheight * 1.5 * 13;
gam_vol_b4off = game_height;
mus_vol_b4off = music_height;

audio_group_load(snd_group_effects);
audio_group_load(snd_group_music);

instance_deactivate_object(self);