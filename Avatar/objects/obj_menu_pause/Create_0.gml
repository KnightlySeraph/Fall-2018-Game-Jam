/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width - 512;
menu_y = gui_height - 384;


menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[5] = "Resume";
menu[4] = "Restart Last Checkpoint";
menu[3] = "Restart Level";
menu[2] = "Main Menu";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_cursor = -1;

menu_top = menu_y - menu_itemheight * 1.5 * menu_items;

instance_deactivate_object(self);