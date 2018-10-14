if(wall != noone)
{
	if(searchfor == 0)
	{	
		if(place_meeting(x,y,obj_wind))
		{
			wall.receivingLeftFacingInput = true;
			sprite_index = spr_pinwheel_spin;
		}
		else
		{
			wall.receivingLeftFacingInput = false;	
			sprite_index = spr_pinwheel;
		}
	}
	else
	{
		if(place_meeting(x,y,obj_wind))
		{
			wall.receivingBottomFacingInput = true;
			sprite_index = spr_pinwheel_spin;
		}
		else
		{
			wall.receivingBottomFacingInput = false;
			sprite_index = spr_pinwheel;
		}
	}
}
else
{
	if(searchfor == 0)
	{	
		for (i = 0; i < instance_number(obj_movingPlatform); i += 1)
		{
			if(instance_find(obj_movingPlatform,i).puzzle_num == puzzle_num)
			{
				wall = instance_find(obj_movingPlatform,i);
			}
		}	
	}
	else
	{
		for (i = 0; i < instance_number(obj_movingWall); i += 1)
		{
			if(instance_find(obj_movingWall,i).puzzle_num == puzzle_num)
			{
				wall = instance_find(obj_movingWall,i);
			}
		}	
	}
}



