/// @description Draw Options Menu

draw_set_font(fMenu);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

for(var i = 0; i < menu_items; i++)
{
	var col;
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
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * i * 1.5);
	draw_text(xx,yy,txt);
}
