/// @description Create Particle System
//Create Particle System
vomit_sys = part_system_create();

//Create Particle
vomit = part_type_create();
part_type_sprite(vomit, spr_FatherParticleVomit, 0, 0, 0);
part_type_scale (vomit, 1, 1);
part_type_size(vomit, 0.5, 0.7, -0.005, 0);
part_type_alpha2(vomit, 1, 0.25);
part_type_speed(vomit, 0.001, 0.003, 0, 0);
part_type_direction(vomit, 240, 300, 0, 1);
part_type_gravity(vomit, 0.2, 260);
part_type_life(vomit, room_speed * 2, room_speed * 4);
part_type_blend(vomit, 0);


//Create Emitter
part_emit = part_emitter_create(vomit_sys);
part_emitter_region(vomit_sys, part_emit, x - 40, x + 40, y - 40, y + 40, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_stream(vomit_sys, part_emit, vomit, 1);