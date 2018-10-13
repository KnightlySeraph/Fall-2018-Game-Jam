switch(state)
{
	case("idle"):
		if(distance_to_object(obj_player) <= moverange)
		{
			if(!collision_line(x,y, obj_player.x, obj_player.y, obj_wall, false, false))
			{
				state = "move";
				player_x = obj_player.x;
				player_y = obj_player.y;
				original_x = x;
				original_y = y;
				
				if(player_x > x)
				{
					if(distance_to_point(player_x + 20, player_y) > move_distance)
					{
						movetype = "regular";
					}
				}
				else
				{
					if(distance_to_point(player_x - 20, player_y) > move_distance)
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
		if(movetype == "regular")
		{
			if(player_x > x)
			{
				move_towards_point(player_x - 20, player_y, spd);
			}
			else
			{
				move_towards_point(player_x + 20, player_y, spd);
			}
		
			if(distance_to_point(original_x, original_y) > move_distance)
			{
				speed = 0;
				state = "look";
				alarm[0] = 30;
			}
		}

		break;
}

