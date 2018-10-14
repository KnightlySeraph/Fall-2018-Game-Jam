/// @description Init all Boss Variables
//Set the Father's health
frogFatherHealth = 40;

//Set his ability used booleans
vomitOnCooldown = false;
gunOnCooldown = false;
tongueOnCooldown = false;

//Set ability cooldowns
vomitCooldown = 5;
gunCooldown = 5;
tongueCooldown = 3;

//Unique booleans
fireTwice = false;

//Player Reference
if (instance_exists(obj_player)) { //Check to see if the player exists
	pX = obj_player.x;
	pY = obj_player.y;
}

//Init State Machine
states = array_create(7);
staes[0] = "Let-Me_Introduce-Myself";
states[1] = "idle";
states[2] = "moving";
states[3] = "tongue";
states[4] = "gun";
states[5] = "vomit";
states[6] = "death";

current_state = states[0];
//if (current_state = "Let-Me_Introduce-Myself" ) { show_message("Great Succsess"); }
