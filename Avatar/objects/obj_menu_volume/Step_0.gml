/// @description Control menu

if(menu_control)
{
	if(keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if(menu_cursor < 0 ) menu_cursor = menu_items - 1;
	}
	if(keyboard_check_pressed(vk_enter))
	{
		menu_committed = menu_cursor;
		//menu_control = false;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	if(mouse_y_gui <= menu_y) && (mouse_y_gui >= menu_y - menu_itemheight * 1.2)
	{
		menu_cursor = 0;
		if(mouse_check_button_pressed(mb_left))
		{
			menu_committed = menu_cursor;
		}
	}
	else if(mouse_y_gui <= menu_y - menu_itemheight * 1.3) && (mouse_y_gui >= menu_y - menu_itemheight * 1.5 * 2)
	{
		if(mouse_x_gui <= menu_x - 170) && (mouse_x_gui >= menu_x - 210)
		{
			menu_cursor = 1;
		}
		else if(mouse_x_gui <= menu_x - 70) && (mouse_x_gui >= menu_x - 130)
		{
			menu_cursor = 2;
		}
		else if(mouse_x_gui <= menu_x + 130) && (mouse_x_gui >= menu_x + 80)
		{
			menu_cursor = 3;
		}
		else if(mouse_x_gui <= menu_x + 230) && (mouse_x_gui >= menu_x + 180)
		{
			menu_cursor = 4;
		}
		if(mouse_check_button_pressed(mb_left))
		{
			menu_committed = menu_cursor;
		}
	}
	else if(mouse_y_gui <= menu_y - menu_itemheight * 1.5 * 3) && (mouse_y_gui >= menu_y - menu_itemheight * 1.5 * 13)
	{
		if(mouse_x_gui <= menu_x - 100) && (mouse_x_gui >= menu_x - 200)
		{
			if(mouse_check_button(mb_left))
			{
				game_height = mouse_y_gui;
				game_volume = ((menu_y - menu_itemheight * 1.5 * 3) - game_height)/((menu_y - menu_itemheight * 1.5 * 3) - (menu_y - menu_itemheight * 1.5 * 13));
			}
		}
		else if(mouse_x_gui <= menu_x + 200) && (mouse_x_gui >= menu_x + 100)
		{
			if(mouse_check_button(mb_left))
			{
				music_height = mouse_y_gui;
				music_volume = ((menu_y - menu_itemheight * 1.5 * 3) - music_height)/((menu_y - menu_itemheight * 1.5 * 3) - (menu_y - menu_itemheight * 1.5 * 13));
			}
		}
	}
	else if(mouse_y_gui < menu_y - menu_itemheight * 1.5 * 2) || (mouse_y_gui > menu_y)
	{
		menu_cursor = -1;
	}
}

if(menu_committed != -1)
{
	switch(menu_committed)
	{
		case 0: 
			instance_activate_object(obj_menu_options);
			instance_deactivate_object(self);
			menu_committed = -1;
			global.pausestep -= 1;
			break;
		case 1:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
		case 2:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
		default:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
	}
}
