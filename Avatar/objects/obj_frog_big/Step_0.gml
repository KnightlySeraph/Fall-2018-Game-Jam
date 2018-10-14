switch(state)
{
	case("idle"):
		sprite_index = spr_frog_big;
		if(distance_to_object(obj_player) <= moverange)
		{
			if(!collision_line(x,y, obj_player.x + (sign(x - obj_player.x) * maxdistance ), obj_player.y, obj_wall, false, false))
			{
				if(!cooldown)
				{
					state = "move";
				}
			}
		}
		if(place_meeting(x,y,obj_wind) && !immune)
		{
			state = "hurt";	
			immune = true;
			maxHealth -= 1;
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
		if(place_meeting(x,y,obj_wind) && !immune)
		{
			state = "hurt";	
			immune = true;
			maxHealth -= 1;
		}
		break;
		
	case("attack"):
		speed = 0;
		
		attack_timer += 1;
		if(attack_timer >= 10)
		{
			sprite_index = spr_frog_big_attack;
		}
		
		if(attack_timer >= 38)
		{
			instance_destroy(damage_sphere);
			damage_sphere = noone;
		}
		else if(attack_timer >= 21)
		{
			if(damage_sphere == noone)
			{
				damage_sphere = instance_create_depth(x,y, depth + 1, obj_frog_big_damage);
				damage_sphere.image_xscale = image_xscale;
			}
		}
		
		if(attack_timer >= 41)
		{
			attack_timer = 0;
			state = "idle";
			cooldown = true;
			alarm[0] = 30;
		}
		break;
	case("hurt"):
		sprite_index = spr_frog_big_hurt;
		attack_timer += 1;
		if(attack_timer >= 9)
		{
			attack_timer = 0;
			state = "idle";
			alarm[1] = 20;
		}
		break;
	case("dead"):
		sprite_index = spr_frog_big_dead;
		timer+= 1;
		if(timer >= 19)
		{
			instance_destroy();	
		}
		break;
}

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}

if(maxHealth <= 0  && state != "dead")
{
	instance_destroy(damage_sphere);
	state = "dead";
	timer = 0;
}