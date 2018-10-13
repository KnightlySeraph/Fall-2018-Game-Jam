if(wall != noone)
{
	if(searchfor == 0)
	{	
		if(place_meeting(x,y,obj_wind))
		{
			wall.receivingLeftFacingInput = true;
		}
		else
		{
			wall.receivingLeftFacingInput = false;	
		}
	}
	else
	{
		if(place_meeting(x,y,obj_wind))
		{
			wall.receivingBottomFacingInput = true;
		}
		else
		{
			wall.receivingBottomFacingInput = false;	
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



