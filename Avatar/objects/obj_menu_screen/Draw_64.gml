/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, gui_width, gui_height, 0);

//set up for menu display
draw_set_alpha(1);
draw_set_font(fMenu);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

//temporary variables
var col;
var xx;
var yy;

//creates and highlights menu
for(var i = 0; i < menu_items; i++)
{
	var txt = menu[i];
		if(menu_cursor == i)
	{
		col = c_silver;
	}
	else
	{
		col = c_black;
	}
	draw_set_color(col);
	if(i == 0)
	{
		xx = menu_x;
		yy = menu_y;
		draw_text(xx,yy,txt);
	}
	else if(i == 1)
	{
		if(menu_cursor != 1)
		{
			if(is_Full){ col = c_silver; draw_set_color(col); }
			else if(!is_Full){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x - 50;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 2)
	{
		if(menu_cursor != 2)
		{
			if(!is_Full){ col = c_silver; draw_set_color(col); }
			else if(is_Full){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x + 50;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
}

//creates labels
col = c_silver;
draw_set_color(col);
var word = label;
xx = menu_x;
yy = menu_y - menu_itemheight * 1.5 * 2;
draw_text(xx,yy,word);