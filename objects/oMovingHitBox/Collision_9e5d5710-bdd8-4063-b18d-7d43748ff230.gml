/// @description Hit enemy and apply damage
if other.state != other.DEAD and other.state != other.KO		// A Player can't hit enemies who are DEAD or KO
and parentId != other.id 										// Hit any other Player but not the owner one
{
	/// -------- Manage enemy life ------------
	if abs(other.depth - depth) <= PlayerLayerSize 
	and (abs(other.y - y) <= PlayerLayerSize)			// Check if Player punch and Enemy are in the depth and Y range to receive hit
	{
		addParticles(0, other.x, other.y - other.sprite_height/2 + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
		hitstun(5, other);
		
		if other.life > damage						// If Enemy has still enough life points...
		{
			other.chanceToRetreat+=10;				// Increase the retreatCounter
			if damage = 1							// If the hit box received is low damaging...
			{
				other.state = other.HURT;			// ...go to HURT state
			}
			else									// But if it is hard damaging (any value over 1)...
				other.state = other.KO;				// ...go to KO state
		}
		else										// If it was the last impact the enemy could receive...
		{
			other.state = other.DEAD;				// ...go to DEAD state
			other.alarm[4]= room_speed*other.timeToDisapear;	// And start the alarm to make the enemy disapear after DEAD
		}
		
		other.facing = -parentId.facing;			// Enemy always looks to the opposite direction of Hit
		other.life -= damage;						// In both cases decrease Enemy's life points
		deformScale(0.9,1.1,other);					// Stretch sprite on Hit for better gameplay feel
		other.image_index = 0;						// and reset the animations index
		
		/// ------- Gameplay tweaks ---------------
		if !parentId.onGround							// If this hit box is from an air kick
			parentId.vx = parentId.vx/2;				// Slow down the Player advance when hit
		
		// Some advance trick for every Hit to improve gameplay
		if !position_meeting(parentId.x + 5*sign(parentId.facing), parentId.y, oParSolid)			// If Player won't collide with any solid wall
			parentId.x += 5*parentId.facing;						// Player advance slightly
	
		/// ------- Update enemy info -------------
		// If this enemy is been hit, show her Health bar info
		oParEnemy.showInfo = false;			// Hide any other enemys HealthBar
		other.showInfo = true;				// Show this HealthBar
		
		instance_destroy();							// Destroy on Hit
	}
}