/// @description The Father's AI
//Balloons Attach to Frog and stay pinned
balloonObj1.x = x - 200;
balloonObj1.y = y - 375;
balloonObj2.x = x + 175;
balloonObj2.y = y - 325;
//Constant Player Reference
if (instance_exists(obj_player)){
	pX = obj_player.x;
	pY = obj_player.y;
}
//Always Face Player
if (instance_exists(obj_player)){
	//If Father is to the right of the player
	if (x > pX){
		//Face Left
		image_xscale = 1;
		facingLeft = true;
		facingRight = false;
	}
	//Implicitly locacted left of player
	else{
		image_xscale = -1;
		facingRight = true;
		facingLeft = false;
	}
}

//Set the player distance range
dist = abs(x - pX);
if (dist > 1200) { //Player is far away
	longRange = true;
	midRange = false;
	shortRange = false;
}
else if (dist < 450) {
	longRange = false;
	midRange = false;
	shortRange = true;
}
else { //Implicitly mid-range
	longRange = false;
	midRange = true;
	shortRange = false;
}

//Debug Distance Key
//Make Cam Larger
if (keyboard_check_pressed(ord("R"))) { obj_camera.vectorViewSizeFactor += 1; }
if (keyboard_check_pressed(ord("L"))) { 
	show_debug_message("Player is " + string(dist)); 
	//Log out cooldown bools
	show_debug_message("Vomit on Cooldown: " + string(vomitOnCooldown) + "		Gun on Cooldown: " + string(gunOnCooldown) + "		Tongue on Cooldown: " + string(tongueOnCooldown));
	//Log current State
	show_debug_message("Current State is " + string(current_state));
	//Log status of lockState
	show_debug_message("lockState is: " + string(lockState));
}

//Distance Reference
//450 and Below is close
//1200 and above is far

//Introduction Event
if (current_state = states[0]){
	//Perform the cutscene animation
	
	
	//Transition Logic goes here
	if (introEnded){
		current_state = states[1];	
	}
}

//Idle Event
if (current_state = states[1]){
	//Perform the Father's Idle
	sprite_index = spr_FatherIdle;
	
	//==============TRANSITION LOGIC===================
	//Consider Death
	if (frogFatherHealth <= 0){
		//Transition to death animation
		current_state = states[6];
	}
	//Consider Mid-Range Attack
	else if (midRange && !tongueOnCooldown){
		//Transition to tongue attack
		current_state = states[3];
		//Lock the machine
		lockState = true;
	}
	//Consider Vomiting
	else if (shortRange && !vomitOnCooldown){
		//Transition to vomit attack
		current_state = states[5];	
		//Lock the state machine till vomit event is finished
		lockState = true;
	}
	//Consider Shooting
	else if (longRange && !gunOnCooldown){
		//Transition to gun attack
		current_state = states[4];
		//Lock the State Machine
		lockState = true;
	}
	//Transition to Movement
	else{
		current_state = states[2];	
	}
	
}

//Movement Event 
if (current_state = states[2]){
	//Slowly move to player location
	if (dist > 250){
		if ( x > pX) {
			x -= 4; 	
		}
		else{
			x += 4;	
		}
		if(y > pY){
			//Moving Down
			y -= 4;
		}
		else{
			//Moving Down
			y += 4;
		}
	}
	
	//Transition Logic goes here
	current_state = states[1];
}

//Tongue Event
if (current_state == states[3]){
	//Perform the Tongue Attack --MidRange Action
	
	tongueOnCooldown = true;
	//Change Animation
	sprite_index = spr_FatherTongue;
	if(!instance_exists(obj_tongueTip) && createTongue){
		instance_create_depth(x - 50, y -275, 0, obj_tongueTip);
		if (facingLeft) {
			obj_tongueTip.moveLeft = true;	
		}
		else{
			obj_tongueTip.moveRight = true;	
		}
	}
	
	//=================TRANSITION LOGIC==============
	//Check if Machine is locked
	if (lockState == false){
		//Start Cooldown Timer
		alarm[2] = tongueCooldown * room_speed;
		//Consider Death
		if (frogFatherHealth <= 0){
			current_state = states[6];	
		}
		//Go back to idle
		else{
			current_state = states[2];	
		}
	}
	
}

//Gun Event
if (current_state == states[4]){
	//Perform the gun attack
	gunOnCooldown = true;
	if (!goToFireGunAnim && !goToPutAwayGunAnim){
		sprite_index = spr_FatherGunDraw;
	}
	else if (goToFireGunAnim){
		sprite_index = spr_FatherFireGun;	
	}
	else if (goToPutAwayGunAnim){
		sprite_index = spr_FatherGunAway;	
	}
	//Animation End event will switch to gun fire
	
	//Transition Logic goes here
	//check stateLock
	if (lockState == false){
		//Event is done do cooldown
		alarm[1] = gunCooldown * room_speed;
		//Consider Death
		if(frogFatherHealth <= 0){
			current_state = states[6];	
		}
		else{ //Move to idle
			current_state = states[1];	
		}
	}
}

//Vomit Event
if (current_state == states[5]){
	//Perform the vomit attack
	vomitOnCooldown = true;
	//Lock this State till the animation is done	
	
	sprite_index = spr_FatherVomit;
	//Create Vomit Particle, and only create when frog opens mouth 
	if (image_index > 7 && image_index < 8){
		if(facingLeft){
			if (!instance_exists(obj_FatherVomitParticle)){
				part_sys = instance_create_depth(x - 275, y - 250, 100000, obj_FatherVomitParticle);
			}		
		}
		else { //Implicit Facing Right
			if(!instance_exists(obj_FatherVomitParticle)){
				part_sys = instance_create_depth(x + 275, y - 250, 100000, obj_FatherVomitParticle);	
			}
		}
	}
	//Kill Particles
	if (image_index > 15 && image_index < 16){
		if(instance_exists(obj_FatherVomitParticle)){
			//Alarm kills system
			part_system_destroy(obj_FatherVomitParticle.vomit_sys);
			instance_destroy(obj_FatherVomitParticle);
		}
	}
	//===================TRANSITION LOGIC=================
	//Check transLock
	if(lockState == false){
		//Event has finished so start cooldown alarm
		alarm[0] = vomitCooldown * room_speed;
		//Conider Death
		if (frogFatherHealth <= 0 ){
			current_state = states[6];	
		}
		//Consider a tongue attack
		else if (!tongueOnCooldown){
			current_state = states[3];
		}
		//Go back to idle
		else {
			current_state = states[1];	
		}
	}
	
}

//Death Event
if (current_state = states[6]){
	//Perform the Death animation
	
	//Transition Logic goes here
}

