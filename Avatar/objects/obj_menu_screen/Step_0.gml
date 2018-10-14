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
		if(mouse_x_gui <= menu_x - 20) && (mouse_x_gui >= menu_x - 60)
		{
			menu_cursor = 1;
		}
		else if(mouse_x_gui <= menu_x + 60) && (mouse_x_gui >= menu_x + 20)
		{
			menu_cursor = 2;
		}
		if(mouse_check_button_pressed(mb_left))
		{
			menu_committed = menu_cursor;
		}
	}
	else if(mouse_y_gui < menu_y - menu_itemheight * 1.5 * 2) || (mouse_y_gui > menu_y)
	{
		menu_cursor = -1;
	}
}

//actions to take when menu option is selected
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
			if(!is_Full){ is_Full = true; window_set_fullscreen(is_Full); }
			menu_committed = -1;
			break;
		case 2:
			if(is_Full){ is_Full = false; window_set_fullscreen(is_Full); }
			menu_committed = -1;
			break;
		default:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
	}
}