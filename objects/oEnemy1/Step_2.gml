/// @description Properties updates

// Reset sprite deformation (for gameplay bouncing feeling. See deformScale())
xScale = Approach(xScale,1,0.03);
yScale = Approach(yScale,1,0.03);

// Update state properties
image_xscale = facing*xScale;		// Player sprite always looks on facing direction. And update xScale deformation 
image_yscale = yScale;				// Update yScale deformation
depth = -1*y;						// Update Enemy depth
	
// -------------------------------------------------------- //

// We handle enemy speed for possible knockbacks and momentums
repeat(abs(vx)) {
	if (!position_meeting(x + sign(vx), y, oParSolid))							// If don't collide with any solid...
		x += sign(vx);															// ..update x position
	else 
	{
		if vx > 1 and state = KO				// But hitting a solid at fast speed when kicked...
		{
			if life > 1							// ...means loosing life
				life -=1;
			else
				state = DEAD;					// if life was neard to death, die.
			addParticles(0, x, y - sprite_height/2 + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
		}
		x -= sign(vx)*30;	// Bounch when Hit a solid with knockback momentum
		vx = 0;	
		break;
	}
}

// Destroy after vanish
if vanish
{
	image_alpha -= 0.01;
	if image_alpha <= 0
	{
		if instance_exists(myBattleArea)
			myBattleArea.enemiesInArea -= 1;	// Before destroy, decreases the "enemiesInArea" counter
		instance_destroy();
	}
}

