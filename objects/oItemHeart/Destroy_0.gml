/// @description Destroy FX

if owner.life < owner.maxLife	// if Player's life is not at it's max...
{
	repeat(20)
		addParticles(0, x, y + irandom_range(0,-10), irandom_range(1,-1), irandom_range(-5,-10), 1, c_red, random_range(0.4,0.6), depth + choose(1,-1), 20, true, sDust, 0, -5, false);
	owner.life += life			// ..recover life as much as this item can
}
else							// Change the FX of particles to show that this heart won't be useful
	repeat(10)
		addParticles(0, x, y + irandom_range(0,-10), irandom_range(1,-1), irandom_range(-1,-3), 1, c_maroon, random_range(0.4,0.6), depth + choose(1,-1), 20, true, sDust, 0, 0, false);

	

