if(place_meeting(x,y,obj_player))
{
	obj_checkpoint_control.xvalue = x;
	obj_checkpoint_control.yvalue = y;
	obj_checkpoint_control.checked = true;
}

if((obj_checkpoint_control.xvalue == x) && (obj_checkpoint_control.yvalue == y))
{
	sprite_index = spr_balloon_blue;
}
else
{
	sprite_index = spr_balloon_red;
}