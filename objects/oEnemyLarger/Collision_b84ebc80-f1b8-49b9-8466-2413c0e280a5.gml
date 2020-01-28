/// @description Hit against other partner

if other.state != other.DEAD and other.state != other.KO	// Can't crash partners who are DEAD or KO
{
	/// -------- Manage enemy life ------------
	if abs(other.depth - depth) <= PlayerLayerSize 
	and (abs(other.y - y) <= PlayerLayerSize)				// Check if this Enemy and the crash receiver are in the depth and Y range to receive hit
	{
		if state = KO and image_index > 1 and abs(vx) > 0	// If Enemy has been thrown and crashes against a partner
		{
			vx = 0;									// Stop momentum for this Enemy
			// Manage crash receiver
			addParticles(0, other.x, other.y - other.sprite_height/2, 0, 0, 0.5, c_white, 0.75, depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
			other.image_index = 0;					
			if other.life > 1						// If Partner has still enough life points...
					other.state = other.KO;			// ...go to KO state.
				else								// But if it is the last impact that could receive...
					other.state = other.DEAD;		// ...go to DEAD state
			other.state = other.KO;
			other.koType = "";
	
			/// ------- Update enemy info -------------
			// If this enemy is been hit, show her Health bar info
			oParEnemy.showInfo = false;			// Hide any other enemys HealthBar
			other.showInfo = true;				// Show this HealthBar
		}
	}
}