if(wall != noone)
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

