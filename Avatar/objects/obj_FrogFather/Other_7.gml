/// @description Unlock States and Other Stuff
//Check if vomiting
if (sprite_index == spr_FatherVomit){
	//Unfreeze the state machine
	lockState = false;
}

if (sprite_index == spr_FatherGunDraw){
	goToFireGunAnim = true;
}

if (sprite_index == spr_FatherFireGun){
	goToPutAwayGunAnim = true;
	goToFireGunAnim = false;
}

if (sprite_index == spr_FatherGunAway){
	lockState = false;	
	goToPutAwayGunAnim = false;
}

if (sprite_index == spr_FatherTongue){
	image_speed = 0;
	image_index = 11;
	createTongue = true;
}