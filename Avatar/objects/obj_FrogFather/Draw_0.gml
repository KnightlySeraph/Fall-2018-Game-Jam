/// @description Insert description here
draw_self();

//Send tongue at player
if(instance_exists(obj_tongueTip)){
	tipDist = point_distance(x - 50, y - 275, obj_tongueTip.x, obj_tongueTip.y);
	spr_width = sprite_get_width(spr_tongueTile);
	angle_player = point_direction(x - 50, y - 275, obj_tongueTip.x, obj_tongueTip.y);
	num = tipDist / spr_width;
	gap = tipDist/num;
	for(i = 0; i < num; i++){
		//if (i mod 2 == 0){
			draw_sprite_ext(spr_tongueTile, -1, (x - 50) + lengthdir_x(i * gap, angle_player), (y - 275) + lengthdir_y(i * gap, angle_player), image_xscale, image_yscale, angle_player, c_white, image_alpha);	
		//}
		//else{
		//	draw_sprite_ext(spr_tongueTile, -1, x + lengthdir_x(i * gap, angle_player), y + lengthdir_y(i * gap, angle_player), image_xscale, image_yscale, angle_player, c_white, image_alpha);		
		//}
	}
}
