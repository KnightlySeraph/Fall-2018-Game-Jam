gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_itemheight = 64;
menu_itemlength = 64;
menu_x = gui_width/2 - menu_itemlength;
menu_y = gui_height - 2 * menu_itemheight;


menu_committed = -1;
menu_control = true;

menu[5] = spr_resume;
menu[4] = spr_restart_cp;
menu[3] = spr_restart;
menu[2] = spr_main;
menu[1] = spr_opt;
menu[0] = spr_quit;

menu_items = array_length_1d(menu);

menu_cursor = -1;

menu_top = menu_y - menu_itemheight * 1.5 * menu_items;

instance_deactivate_object(self);