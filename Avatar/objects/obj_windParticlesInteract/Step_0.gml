//Particle Emitter
if (emitting){
	part_emit = part_emitter_create(part_system);
	part_emitter_region(part_system, part_emit, x-80, x+80, y-80, y+80, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(part_system, part_emit, part, 5);
}
