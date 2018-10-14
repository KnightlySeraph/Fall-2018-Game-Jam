/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_deathscreen, 0, 0, 0, gui_width, gui_height);

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
		col = c_red;
	}
	draw_set_color(col);
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * i * 1.5);
	draw_text(xx,yy,txt);
}

var word = label;
var xxx = menu_x;
var yyy = menu_y - menu_itemheight * 1.5 * 6;
col = c_red;
draw_set_color(col);
draw_text(xxx, yyy, word);