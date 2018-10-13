switch(state)
{
	//Sitting in one spot
	case("idle"):
		//Play is within the max movement range
		if(distance_to_object(obj_player) <= moverange)
		{
			//Discance to player does not collide with walls
			if(!collision_line(x,y, obj_player.x + (sign(x - obj_player.x) * maxdistance ), obj_player.y, obj_wall, false, false))
			{
				state = "move";
				player_x = obj_player.x;
				player_y = obj_player.y;
				original_x = x;
				original_y = y;
				
				if(player_x > x)
				{
					//See if the player is within their movedistance
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
					//See if the player is within their movedistance
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
			direct = 1;
		}
		else
		{
			image_xscale = 1;	
			direct = -1;
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

if(can_attack && !attacking)
{
	if(player_x > x)
	{
		image_xscale = -1;
		direct = 1;
	}
	else
	{
		image_xscale = 1;	
		direct = -1;
	}
	if((player_y + 20 > y && player_y - 20 < y) && !collision_line(x,y,original_x,player_y,obj_wall,false,false))
	{
		attacking = true;
	}
}

if(attacking)
{
	sprite_index = spr_frog_sad_attack;
	attack_timer += 1;
	if(attack_timer >= 19)
	{
		attack_timer = 0;
		attacking = false;
	}
	else if(attack_timer >= 11 && can_attack)
	{
		can_attack = false;
		alarm[1] = 120;
		with(instance_create_depth(x,y - 30,depth + 1, obj_projectile))
		{
			state = "forward";
			direct = other.direct;
		}
	}
}
else
{
	sprite_index = spr_frog_sad;	
}


if(place_meeting(x,y,obj_wind))
{
	instance_destroy();
}

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}


