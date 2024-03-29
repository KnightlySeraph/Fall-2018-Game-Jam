/// @description Particle System
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
part_type_life(part, room_speed * 1, room_speed*2);
part_type_blend(part, 0);


//Particle Emitter
part_emit = part_emitter_create(part_system);
part_emitter_region(part_system, part_emit, x-80, x+80, y-80, y+80, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(part_system, part_emit, part, 5);
