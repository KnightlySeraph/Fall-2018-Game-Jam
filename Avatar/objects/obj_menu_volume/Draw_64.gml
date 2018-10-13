/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, gui_width, gui_height, 0);

draw_set_alpha(1);
draw_set_font(fMenu);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

var col;
var xx;
var yy;

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
		xx = menu_x - 200;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 2)
	{
		xx = menu_x - 100;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 3)
	{
		xx = menu_x + 100;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
	else if(i == 4)
	{
		xx = menu_x + 200;
		yy = menu_y - (menu_itemheight * 1.5);
		draw_text(xx,yy,txt);
	}
}