/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

credit_x = gui_width - 512;
credit_y = gui_height - 384;

//menu_speed = 25;
credit_font = fCredits;
credit_itemheight = font_get_size(fMenu);

text[0] = "Captain Zoey's Crusade";
text[1] = "Cameron Pyfferoen";
text[2] = "Alex Myers";
text[3] = "Justin Bryant";
text[4] = "Programmers:";
text[5] = "Syd";
text[6] = "Moe";
text[7] = "Katelyn";
text[8] = "Christopher Brewer";
text[9] = "Artists:";

draw_set_color(c_white);
draw_set_font(fCredits);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
