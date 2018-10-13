if(obj_player.direct = 1)
{
	image_xscale = 1;	
	x = obj_player.x + 80;
	y = obj_player.y - 30;
}
else
{
	image_xscale = -1;	
	x = obj_player.x - 80;
	y = obj_player.y - 30;
}
