if(place_meeting(x,y,obj_player))
{
	if(!obj_player.dead)
	{
		show_debug_message("hit");
		obj_checkpoint_control.checked = false;
		obj_checkpoint_control.xvalue = 0;
		obj_checkpoint_control.yvalue = 0;
		if(room == Level1)
		{
			room_goto(Level2);
		}
		else if(room == Level2)
		{
			room_goto(TheFrogFather);	
		}
	}
}