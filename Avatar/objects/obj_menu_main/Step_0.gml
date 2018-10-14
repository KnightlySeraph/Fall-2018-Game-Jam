/// @description Control menu

if(menu_control)
{
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	/*
	if(mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if(mouse_check_button_pressed(mb_left))
		{
			menu_committed = menu_cursor;
		}
	}
	*/
	if(mouse_y_gui < menu_y + 1.5 * menu_itemheight) && (mouse_y_gui >= menu_y)
	{
		if(mouse_x_gui <= menu_x + 2 * menu_itemlength) && (mouse_x_gui > menu_x)
		{
		menu[0] = spr_quit_hover;
		menu[1] = spr_opt;
		menu[2] = spr_cred;
		menu[3] = spr_new;
		menu_cursor = 0;
		if(mouse_check_button(mb_left)) { menu_committed = menu_cursor; }
		}
	}
	else if(mouse_y_gui < menu_y) && (mouse_y_gui >= menu_y - 1.5 * menu_itemheight)
	{
		if(mouse_x_gui <= menu_x + 2 * menu_itemlength) && (mouse_x_gui > menu_x)
		{
		menu[0] = spr_quit;
		menu[1] = spr_opt_hover;
		menu[2] = spr_cred;
		menu[3] = spr_new;
		menu_cursor = 1;
		if(mouse_check_button(mb_left)) { menu_committed = menu_cursor; }
		}
	}
	else if(mouse_y_gui < menu_y - 1.5 * menu_itemheight) && (mouse_y_gui >= menu_y - 1.5 * menu_itemheight * 2)
	{
		if(mouse_x_gui <= menu_x + 2 * menu_itemlength) && (mouse_x_gui > menu_x)
		{
		menu[0] = spr_quit;
		menu[1] = spr_opt;
		menu[2] = spr_cred_hover;
		menu[3] = spr_new;
		menu_cursor = 2;
		if(mouse_check_button(mb_left)) { menu_committed = menu_cursor; }
		}
	}
	else if(mouse_y_gui < menu_y - 1.5 * menu_itemheight * 2) && (mouse_y_gui >= menu_y - 1.5 * menu_itemheight * 3)
	{
		if(mouse_x_gui <= menu_x + 2 * menu_itemlength) && (mouse_x_gui > menu_x)
		{
		menu[0] = spr_quit;
		menu[1] = spr_opt;
		menu[2] = spr_cred;
		menu[3] = spr_new_hover;
		menu_cursor = 3;
		if(mouse_check_button(mb_left)) { menu_committed = menu_cursor; }
		}
	}
	else if(mouse_x_gui < menu_x) || (mouse_x_gui > menu_x + 2 * menu_itemlength) 
	{
		menu[0] = spr_quit;
		menu[1] = spr_opt;
		menu[2] = spr_cred;
		menu[3] = spr_new;
		menu_cursor = -1;
	}
}

if(menu_committed != -1)
{
	switch(menu_committed)
	{
		case 0: 
			game_end();
			break;
		case 1:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
		case 2:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
		case 3:
			room_goto(Level1);
			menu_committed = -1;
			break;
		default:
			show_debug_message("These buttons don't work.");
			menu_committed = -1;
			break;
	}
}