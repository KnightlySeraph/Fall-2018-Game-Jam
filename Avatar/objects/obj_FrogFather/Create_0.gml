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
	
	//Edit Player Camera
	obj_camera.vectorViewSizeFactor += 2;
}

//Player Range Booleans
shortRange = false;
midRange = false;
longRange = false;

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


//Triggers
introEnded = true;
facingLeft = true;
facingRight = false;
lockState = false;
goToFireGunAnim = false;
goToPutAwayGunAnim = false;
