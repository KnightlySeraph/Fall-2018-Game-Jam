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
		}
		break;
}