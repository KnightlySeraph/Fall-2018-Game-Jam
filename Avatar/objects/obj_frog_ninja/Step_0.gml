if(distance_to_object(obj_player) < maxdistance)
{
	if(!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
	{
		if(can_attack && !attacking)
		{
			attacking = true;
		}	
	}
}

if(attacking)
{
	sprite_index = spr_frog_ninja_attack;
	attack_timer += 1;
	if(attack_timer >= 16)
	{
		attack_timer = 0;
		attacking = false;
	}
	else if(attack_timer >= 13 && can_attack)
	{
		can_attack = false;
		alarm[0] = 90;
		with(instance_create_depth(x,y - 30,depth + 1, obj_projectile))
		{
			state = "follow";
			target_x = obj_player.x;
			target_y = obj_player.y;
		}
	}
}
else if(state == "dead")
{
	sprite_index = spr_frog_ninja_dead;
	timer+= 1;
	if(timer >= 10)
	{
		instance_destroy();	
	}
}
else
{
	sprite_index = spr_frog_ninja;	
}

if(obj_player.x > x)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;	
}

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}

if(place_meeting(x,y,obj_wind) && state != "dead")
{
	state = "dead";
	timer = 0;
}