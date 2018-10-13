switch(state)
{
	case("idle"):
		if(distance_to_object(obj_player) <= moverange)
		{
			if(!collision_line(x,y, obj_player.x + (sign(x - obj_player.x) * maxdistance ), obj_player.y, obj_wall, false, false))
			{
				state = "move";
				player_x = obj_player.x;
				player_y = obj_player.y;
				original_x = x;
				original_y = y;
				
				if(player_x > x)
				{
					if(distance_to_point(player_x - maxdistance, player_y) > move_distance + spd)
					{
						movetype = "regular";
					}
					else
					{
						movetype = "updown";	
					}
				}
				else
				{
					if(distance_to_point(player_x + maxdistance, player_y) > move_distance + spd)
					{
						movetype = "regular";
					}
					else
					{
						movetype = "updown";	
					}
				}
			}
		}
		break;
	case("look"):
		break;
	case("move"):
		if(player_x > x)
		{
			image_xscale = -1;
		}
		else
		{
			image_xscale = 1;	
		}
	
		if(movetype == "regular")
		{
			if(player_x > x)
			{
				move_towards_point(player_x - maxdistance, player_y, spd);
			}
			else
			{
				move_towards_point(player_x + maxdistance, player_y, spd);
			}
		
			if(distance_to_point(original_x, original_y) > move_distance)
			{
				speed = 0;
				state = "look";
				alarm[0] = 30;
			}
		}
		else if(movetype == "updown")
		{
			if((player_y + 20 > y && player_y - 20 < y) || collision_line(x,y,original_x,player_y,obj_wall,false,false))
			{
			speed = 0;
			state = "look";
			alarm[0] = 30;
			}
			else
			{
				move_towards_point(original_x, player_y, spd);	
			}
		}

		break;
}


if(place_meeting(x,y,obj_wind))
{
	instance_destroy();
}

