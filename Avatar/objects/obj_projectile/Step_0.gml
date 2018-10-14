switch(state)
{
	case("forward"):
		x += spd * direct;
		image_xscale = -direct;
		break;
	case("follow"):
		if(speed == 0)
		{
			move_towards_point(target_x,target_y,spd);
			image_angle = point_direction(target_x,target_y,x,y);
		}
		break;
}

if(place_meeting(x,y,obj_wall))
{
	instance_destroy();	
}