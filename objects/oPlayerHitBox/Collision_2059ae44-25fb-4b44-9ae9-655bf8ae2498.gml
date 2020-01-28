/// @description Hit Player and apply damage
if global.friendlyFire									// Only if friendyFire is set to true...
{														// ...Players are able to hit each other
	if other.state != other.DEAD						// A Player can't hit enemies who are DEAD or KO
	and parentId != other.id							// Hit any other Player but not the owner one
	{
		/// -------- Manage other Player life ------------
		if abs(other.depth - parentId.depth) <= PlayerLayerSize 
		and (abs(other.y - parentId.y) <= PlayerLayerSize)			// Check if Player punch and Enemy are in the depth and Y range to receive hit
		{
			addParticles(0, x + (sprite_width/2*parentId.facing), y + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
			hitstun(5, other);							// Stun the oppnent for a few milliseconds
		
			if parentId.weapon != ""					// if Player hit with a weapon...
				weaponDurability(parentId)				// ...check its durability
		
			if other.life > damage						// If Enemy has still enough life points...
				other.state = other.HURT;				// ...go to HURT state
			else										// If it was the last impact the enemy could receive...
				other.state = other.DEAD;				// ...go to DEAD state
		
			other.life -= damage;						// In both cases decrease Enemy's life points
			deformScale(0.9,1.1,other);					// Stretch sprite on Hit for better gameplay feel
			looseWeapon(other);							// Take out weapon from Player's hand
			other.image_index = 0;						// and reset the animations index
			
			/// ------- Gameplay tweaks ---------------
			if !parentId.onGround							// If this hit box is from an air kick
				parentId.vx = parentId.vx/2;				// Slow down the Player advance when hit
		
			// Some advance and knockback trick for every Hit to improve gameplay
			if !position_meeting(other.x + 5*sign(parentId.facing), other.y, oParSolid)			// If opponent won't collide with any solid wall
			{
				parentId.x = parentId.x + 5*parentId.facing;						// Hitter advance slightly
				other.x = other.x + 4*parentId.facing;								// knockback opponent
			}
		}
	}
}