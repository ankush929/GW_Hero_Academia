/// @description Destroy if punched
opponent = other.parentId;
if abs(depth - other.depth) <= PlayerLayerSize and y + sprite_height + z >= opponent.y
and !destroy
{
	// Hit particles
	var xx = other.x + other.sprite_width/2 - 5;
	var yy = other.y + other.sprite_height + random_range(5,-5);
	addParticles(0, xx, yy, 0, 0, 0.5, c_white, 0.75, opponent.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
	
	if resistance > 0		// decrease object's resistance
		resistance--;
}

if resistance <= 0			// and if resistance is 0, destroy it!
	destroy = true;
