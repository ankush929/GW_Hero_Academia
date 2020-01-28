/// @description Got hit
if state != DEAD						// An enemy hit box can only hit the Player if it is not DEAD
{
	opponent = other.parentId;			// Store the enemy who hit the Player
	if abs(depth - opponent.depth) <= EnemyLayerSize and (abs((y + z) - opponent.y) <= EnemyLayerSize)			// Check if Enemy punch and Player are in the depth and Y range to receive hit
	{
		addParticles(0, other.x + other.sprite_width/2*opponent.facing, other.y + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
		hitstun(5, other);				// Stun the oppnent for a few milliseconds
		
		if life > 1						// If Player has still enough life points...
		{	
			state = HURT;				// ...go to HURT state.
			audio_play_sound(Punch1,10,false);
		}
		else							// But if it is the last impact that could receive...
		{
			state = DEAD;				// ...go to DEAD state
			audio_play_sound(PlayerDeath,10,false);
		}
		
		if grabbedId != -1
			grabbedId.grabbed = false;
		
		life -= 0.3;						// In both cases decrease Player's life points
		deformScale(0.9,1.1,id);		// Stretch sprite on Hit for better gameplay feel
		looseWeapon(id);				// Take out weapon from Player's hand
		image_index = 0;				// and reset the animations index
		
		// Some advance and knockback trick for every Hit to improve gameplay
		if !position_meeting(x + sign(5*facing), y, oParSolid)			// If Player won't collide with any solid wall
		{
			opponent.x = opponent.x + 5*opponent.facing;				// Enemy advance slightly
			x = x + 4*opponent.facing;									// knockback Player
		}
		
		// Destroy the oEnemyHitBox once punched a Player
		opponent.punch = -1;
		with other
			instance_destroy();
	}
}
