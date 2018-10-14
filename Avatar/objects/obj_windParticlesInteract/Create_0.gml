/// @description Particle System
//Set up Interaction
emitting = false;
//Set up Colors
color1 = make_color_rgb(117, 209, 198);
//Setup the Particles System
part_system = part_system_create();

//Particle
part = part_type_create();
//part_type_shape(part, pt_shape_disk);
part_type_sprite(part, spr_windPart, 1, 0, 0);
//Default Scale
part_type_scale(part, 1, 1);
part_type_size(part, 0.5, 0.7, 0.005, 0);
part_type_color2(part, color1, c_white);
part_type_alpha2(part, 1, 0.75);
part_type_speed(part, 0.1, 0.3, 0, 0);
part_type_direction(part, 45, 115, 0, 1);
part_type_gravity(part, 0.2, 90);
part_type_life(part, room_speed * 2, room_speed*4);
part_type_blend(part, 0);



