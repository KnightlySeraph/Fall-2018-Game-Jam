updown = 0;
leftright = 0;

if(keyboard_check(ord("W"))) 
{
	updown -= 1;
	tempvsp -= 1;
}
if(keyboard_check(ord("A"))) 
{
	leftright -= 1; 
	temphsp -= 1;
}
if(keyboard_check(ord("S")))
{
	updown += 1; 
	tempvsp += 1;
}
if(keyboard_check(ord("D"))) 
{
	leftright += 1; 
	temphsp += 1;
}

hsp = ((leftright * movespd) + temphsp);
if(abs(hsp) > 15) 
{
	hsp = sign(hsp) * 15;
}
vsp = ((updown * flyspd) + tempvsp);
if(abs(vsp) > 15) 
{
	vsp = sign(vsp) * 15;
}

if(tempvsp != 0)
{
	tempvsp -= 0.5 * sign(tempvsp);	
}
if(temphsp != 0)
{
	temphsp -= 0.5 * sign(temphsp);	
}

if(place_meeting(x+hsp, y, obj_wall))
{
	while(!place_meeting(x+sign(hsp), y, obj_wall))
	{
		x += sign(hsp);	
	}
	temphsp = 17 * -sign(hsp);
	hsp = 0;
}

if(place_meeting(x, y + vsp, obj_wall))
{
	while(!place_meeting(x, y+sign(vsp), obj_wall))
	{
		y += sign(vsp);	
	}
	tempvsp = 17 * -sign(vsp);
	vsp = 0;
}

x += hsp;
y += vsp;

