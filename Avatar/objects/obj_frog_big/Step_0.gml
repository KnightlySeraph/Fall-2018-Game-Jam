switch(state)
{
	case("idle"):
		if(distance_to_object(obj_player) <= moverange)
		{
			if(!collision_line(x,y, obj_player.x + (sign(x - obj_player.x) * maxdistance ), obj_player.y, obj_wall, false, false))
			{
				state = "move";
			}
		}
		break;
		
	case("move"):
	
		if(obj_player.x > x)
		{
			image_xscale = -1;
			if(distance_to_point(obj_player.x - maxdistance, obj_player.y) <= 0)
			{
				state = "attack";
				alarm[0] = 30;
			}
			else if(collision_line(x,y, obj_player.x - maxdistance, obj_player.y, obj_wall, false, false))
			{
				speed = 0;
				state = "idle";
			}
			else
			{
				move_towards_point(obj_player.x - maxdistance, obj_player.y, spd);
			}
		}
		else
		{
			image_xscale = 1;
			if(distance_to_point(obj_player.x + maxdistance, obj_player.y) <= 0)
			{
				state = "attack";
				alarm[0] = 30;
			}
			else if(collision_line(x,y, obj_player.x - maxdistance, obj_player.y, obj_wall, false, false))
			{
				speed = 0;
				state = "idle";
			}
			else
			{
				move_towards_point(obj_player.x + maxdistance, obj_player.y, spd);
			}	
		}
		
		break;
		
	case("attack"):
		speed = 0;
		break;
}