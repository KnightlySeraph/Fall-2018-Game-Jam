updown = 0;
leftright = 0;

if(keyboard_check(ord("W"))) 
{
	//Move Up
	updown -= 1;
	if(tempvsp > -templimit) tempvsp -= 1;
}
if(keyboard_check(ord("A"))) 
{
	//Move Left
	leftright -= 1; 
	if(temphsp > -templimit) temphsp -= 1;
}
if(keyboard_check(ord("S")))
{
	//Move Down
	updown += 1; 
	if(tempvsp < templimit) tempvsp += 2;
}
if(keyboard_check(ord("D"))) 
{
	//Move Right
	leftright += 1; 
	if(temphsp < templimit) temphsp += 1;
}

if(keyboard_check(vk_enter)) shooting = true;
else shooting = false;

//HSP is equal to the speed plus the temp hsp
hsp = ((leftright * movespd) + temphsp);
//If hsp is more than 15, make it 15 and decrease temp hsp
if(abs(hsp) > templimit) 
{
	hsp = sign(hsp) * templimit;
	temphsp -= 0.5 * sign(temphsp);
	
}
//VSP is equal to the speed plus the temp vsp
vsp = ((updown * flyspd) + tempvsp);
//If vsp is more than 15, make it 15 and decrease temp vsp
if(abs(vsp) > templimit) 
{
	vsp = sign(vsp) * templimit;
	tempvsp -= 0.5 * sign(tempvsp);
}

//Decrease temp vsp and hsp if not 0
if(tempvsp != 0)
{
	tempvsp -= 0.5 * sign(tempvsp);	
}
if(temphsp != 0)
{
	temphsp -= 0.5 * sign(temphsp);	
}

//Check if colliding with walls on left or right
if(place_meeting(x+hsp, y, obj_wall))
{
	while(!place_meeting(x+sign(hsp), y, obj_wall))
	{
		x += sign(hsp);	
	}
	//If moving left or right, big bounce
	if(leftright != 0) temphsp = bigbounce * -sign(hsp);
	//Else, small bounce
	else temphsp = smallbounce * -sign(hsp);

	hsp = 0;
}
//Check if colliding with walls up or down
if(place_meeting(x, y + vsp, obj_wall))
{
	while(!place_meeting(x, y+sign(vsp), obj_wall))
	{
		y += sign(vsp);	
	}
	//IF moving up or down, big bounce
	if(updown != 0) tempvsp = bigbounce * -sign(vsp);
	//Else, small bounce
	else tempvsp = smallbounce * -sign(vsp);

	vsp = 0;
}

//SHOOTING
if(shooting)
{
	if(!instance_exists(obj_wind))
	{
		instance_create_depth(x,y,depth, obj_wind);
	}
	temphsp += -direct * 1;
}
else
{
	if(instance_exists(obj_wind))
	{
		instance_destroy(obj_wind);	
	}
}



//Move player
x += hsp;
y += vsp;

//Sprite Machine
if(leftright > 0)
{
	image_xscale = 1;	
	direct = 1;
}
else if(leftright < 0)
{
	image_xscale = -1;
	direct = -1;
}

if(shooting)
{
	sprite_index = spr_player_shoot;	
}
else
{
	sprite_index = spr_player_idle;	
}

