/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(spr_background, 0, 0, 0, gui_width, gui_height);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

var xx;
var yy;

for(var i = 0; i < menu_items; i++)
{
	xx = menu_x;
	yy = menu_y - (menu_itemheight * i * 1.5);
	draw_sprite_stretched(menu[i], 0, xx, yy, 128, 128);
}
