/// @description Hit Player and apply damage
if global.friendlyFire									// Only if friendyFire is set to true...
{														// ...Players are able to hit each other
	if other.state != other.DEAD						// A Player can't hit enemies who are DEAD or KO
	and other.state != other.HURT						// A Player can't hit enemies who are DEAD or KO
	and parentId != other.id							// Hit any other Player but not the owner one
	{
		/// -------- Manage other Player life ------------
		if abs(other.depth - depth) <= PlayerLayerSize 
		and (abs(other.y - y) <= PlayerLayerSize)			// Check if Player punch and Enemy are in the depth and Y range to receive hit
		{
			addParticles(0, other.x, other.y - other.sprite_height/2 + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
			hitstun(5, other);							// Stun the oppnent for a few milliseconds
			if other.life > damage						// If Enemy has still enough life points...
				other.state = other.HURT;					// ...go to HURT state
			else										// If it was the last impact the enemy could receive...
				other.state = other.DEAD;				// ...go to DEAD state
		
			other.life -= damage;						// In both cases decrease Enemy's life points
			deformScale(0.9,1.1,other);					// Stretch sprite on Hit for better gameplay feel
			looseWeapon(other.id);							// Take out weapon from Player's hand
			other.image_index = 0;						// and reset the animations index
		}
	}
}