/// @description Insert description here
// You can write your code in this editor
if(current_time > 0) && (current_time <= 10000)
{
	draw_text(credit_x, credit_y, text[0]);
}
else if(current_time > 10000) && (current_time <= 20000)
{
	for(var i = 1; i < 5; i++)
	{
		draw_text(credit_x, credit_y - (credit_itemheight * 1.5 * i), text[i]);
	}
}
else if(current_time > 20000) && (current_time <= 30000)
{
	for(var i = 5; i < 10; i++)
	{
		draw_text(credit_x, credit_y - (credit_itemheight * 1.5 * (i-4)), text[i]);
	}
}
else{ game_end(); }