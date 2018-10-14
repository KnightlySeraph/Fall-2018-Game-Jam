draw_self();
draw_text_transformed(x - 50,y - 150,windPower,4,4,0);
if(immune)
{
	image_alpha = random_range(0.1,1);	
}
else
{
	image_alpha = 1;
}