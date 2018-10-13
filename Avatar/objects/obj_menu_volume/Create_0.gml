/// @description Options Menu GUI
//set up gui width & height
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

//set up dimensions of menu
menu_x = gui_width - 512;
menu_y = gui_height - 192;

//more menu set up
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

//menu text
menu[4] = "Off";
menu[3] = "On";
menu[2] = "Off";
menu[1] = "On";
menu[0] = "Back";

//label text
label[2] = "Volume";
label[1] = "Music";
label[0] = "Game";

//# of items in label & menu
label_items = array_length_1d(label);
menu_items = array_length_1d(menu);

//set up which menu option to select
menu_cursor = 0;

//top of the menu
menu_top = menu_y - menu_itemheight * 1.5 * menu_items;

//set up game & music volume
game_volume = global.vol_gam;
music_volume = global.vol_mus;

//set up for slidebars
game_height = menu_y - menu_itemheight * 1.5 * 13;
music_height = menu_y - menu_itemheight * 1.5 * 13;
gam_vol_b4off = game_height;
mus_vol_b4off = music_height;

//load audio groups
audio_group_load(snd_group_effects);
audio_group_load(snd_group_music);

//can't be interacted w/ on start up
instance_deactivate_object(self);