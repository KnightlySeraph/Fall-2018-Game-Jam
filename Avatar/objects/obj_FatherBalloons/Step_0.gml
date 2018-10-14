/// @description Insert description here
//Follow FrogFather
if (!immune){
	if (place_meeting(x, y, obj_wind)){
		balloonHealth -= 1;
		immune = true;
		if(sprite_index == spr_FatherBallonsFullNoDmg){
			lockAnim = true;
			sprite_index = spr_FatherBalloonsFullDamaged;	
		}
		else if (sprite_index == spr_FatherBallons75NoDmg){
			lockAnim = true;
			sprite_index = spr_FatherBalloons75Damaged;	
		}
		else if (sprite_index == spr_FatherBalloons50NoDmg){
			lockAnim = true;
			sprite_index = spr_FatherBalloons50Damaged;	
		}
		else{
			lockAnim = true;
			sprite_index = spr_FatherBalloons25Damaged;
		}
	}
}


if(!lockAnim){
	if (balloonHealth > 30){
	sprite_index = spr_FatherBallonsFullNoDmg; 	
	}
	else if (balloonHealth <= 30 && balloonHealth > 20){
		sprite_index = spr_FatherBallons75NoDmg;	
	}
	else if (balloonHealth <= 20 && balloonHealth > 10){
		sprite_index = spr_FatherBalloons50NoDmg;	
	}
	else{
		sprite_index = spr_FatherBalloons25NoDmg;	
	}
	
}

if(balloonHealth <= 0){
	//obj_FrogFather.frogFatherHealth  -= 20;
	
	sprite_index = spr_blank;
	
}
