/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, gui_width, gui_height, 0);

draw_set_alpha(1);
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
