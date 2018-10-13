updown = 0;
leftright = 0;

if(keyboard_check(ord("W"))) 
{
	//Move Up
	updown -= 1;
	if(tempvsp > -15) tempvsp -= 1;
}
if(keyboard_check(ord("A"))) 
{
	//Move Left
	leftright -= 1; 
	if(temphsp > -15) temphsp -= 1;
}
if(keyboard_check(ord("S")))
{
	//Move Down
	updown += 1; 
	if(tempvsp < 15) tempvsp += 1;
}
if(keyboard_check(ord("D"))) 
{
	//Move Right
	leftright += 1; 
	if(temphsp < 15) temphsp += 1;
}

//HSP is equal to the speed plus the temp hsp
hsp = ((leftright * movespd) + temphsp);
//If hsp is more than 15, make it 15 and decrease temp hsp
if(abs(hsp) > 15) 
{
	hsp = sign(hsp) * 15;
	temphsp -= 0.25 * sign(temphsp);
	
}
//VSP is equal to the speed plus the temp vsp
vsp = ((updown * flyspd) + tempvsp);
//If vsp is more than 15, make it 15 and decrease temp vsp
if(abs(vsp) > 15) 
{
	vsp = sign(vsp) * 15;
	tempvsp -= 0.25 * sign(tempvsp);
}

//Decrease temp vsp and hsp if not 0
if(tempvsp != 0)
{
	tempvsp -= 0.25 * sign(tempvsp);	
}
if(temphsp != 0)
{
	temphsp -= 0.25 * sign(temphsp);	
}

//Check if colliding with walls on left or right
if(place_meeting(x+hsp, y, obj_wall))
{
	while(!place_meeting(x+sign(hsp), y, obj_wall))
	{
		x += sign(hsp);	
	}
	//If moving left or right, big bounce
	if(leftright != 0) temphsp = 17 * -sign(hsp);
	//Else, small bounce
	else temphsp = 6 * -sign(hsp);

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
	if(updown != 0) tempvsp = 17 * -sign(vsp);
	//Else, small bounce
	else tempvsp = 6 * -sign(vsp);

	vsp = 0;
}

//Move player
x += hsp;
y += vsp;

