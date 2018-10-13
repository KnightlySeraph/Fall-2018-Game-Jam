/// @description Menu GUI

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width - 512;
menu_y = gui_height - 384;

//menu_speed = 25;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[4] = "New Game";
menu[3] = "Continue";
menu[2] = "Levels";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_cursor = 4;

menu_top = menu_y - menu_itemheight * 1.5 * menu_items;
