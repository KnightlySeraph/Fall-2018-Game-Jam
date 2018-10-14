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
	//sprite_index = spr_frog_sad_attack;
	attack_timer += 1;
	if(attack_timer >= 19)
	{
		attack_timer = 0;
		attacking = false;
	}
	else if(attack_timer >= 11 && can_attack)
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
else
{
	//sprite_index = spr_frog_sad;	
}

if(obj_player.x > x)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;	
}