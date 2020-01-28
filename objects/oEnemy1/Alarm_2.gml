/// @description End KO
if state = KO
{
	// Dust FX
	addParticles(3, x, y + z + 5, irandom_range(-1, 1), 0, random_range(0.5,1), make_color_hsv(0,0,irandom_range(100,130)), 1, depth + choose(1,-1), 30, true, sDust, 0, 0, false);
	image_index = 0;
	state = RECOVER;
}