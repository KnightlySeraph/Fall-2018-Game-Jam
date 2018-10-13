/// @description Insert description here
//set up background effect
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
			if(game_volume > 0){ col = c_silver; draw_set_color(col); }
			else if(game_volume <= 0){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x - 200;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 2)
	{
		if(menu_cursor != 2)
		{
			if(game_volume <= 0){ col = c_silver; draw_set_color(col); }
			else if(game_volume > 0){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x - 100;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 3)
	{
		if(menu_cursor != 3)
		{
			if(music_volume > 0){ col = c_silver; draw_set_color(col); }
			else if(music_volume <= 0){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x + 100;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 4)
	{
		if(menu_cursor != 4)
		{
			if(music_volume <= 0){ col = c_silver; draw_set_color(col); }
			else if(music_volume > 0){ col = c_gray; draw_set_color(col); }
		}
		xx = menu_x + 200;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
}

//creates labels
for(var n = 0; n < label_items; n++)
{
	col = c_silver;
	draw_set_color(col);
	var word = label[n];
	if(n == 0)
	{
		xx = menu_x - 150;
		yy = menu_y - menu_itemheight * 1.5 * 2;
		draw_text(xx,yy,word);
	}
	else if(n == 1)
	{
		xx = menu_x + 150;
		yy = menu_y - menu_itemheight * 1.5 * 2;
		draw_text(xx,yy,word);
	}
	else if(n == 2)
	{
		xx = menu_x;
		yy = menu_y - menu_itemheight * 1.5 * 14;
		draw_text(xx,yy,word);
	}
}

//creates and updates slidebars
for(var m = 0; m <= 3; m++)
{
	if(m == 0)
	{
		col = c_gray;
		draw_set_color(col);
		draw_rectangle(menu_x - 200, menu_y - menu_itemheight * 1.5 * 3, menu_x - 100, menu_y - menu_itemheight * 1.5 * 13, 0);
	}
	else if(m == 1)
	{
		col = c_silver;
		draw_set_color(col);
		draw_rectangle(menu_x - 200, menu_y - menu_itemheight * 1.5 * 3, menu_x - 100, game_height, 0);
	}
	else if(m == 2)
	{
		col = c_gray;
		draw_set_color(col);
		draw_rectangle(menu_x + 100, menu_y - menu_itemheight * 1.5 * 3, menu_x + 200, menu_y - menu_itemheight * 1.5 * 13, 0);
	}
	else if(m == 3)
	{
		col = c_silver;
		draw_set_color(col);
		draw_rectangle(menu_x + 100, menu_y - menu_itemheight * 1.5 * 3, menu_x + 200, music_height, 0);
	}
}

//creates and updates volume #
for(var k = 0; k < 2; k++)
{
	col = c_silver;
	draw_set_color(col);
	var vol;
	var xxx;
	var yyy;
	if(k == 0)
	{
		vol = string_format(game_volume * 100, 3, 0);
		xxx = menu_x - 250;
		yyy = menu_y - menu_itemheight * 1.5 * 8;
		draw_text(xxx,yyy,vol);
	}
	else if(k == 1)
	{
		vol = string_format(music_volume * 100, 3, 0);
		xxx = menu_x + 250;
		yyy = menu_y - menu_itemheight * 1.5 * 8;
		draw_text(xxx,yyy,vol);
	}
}