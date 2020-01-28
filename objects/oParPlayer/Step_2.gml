/// @description Solid collision checks and properties updates

// Reset sprite deformation (for gameplay bouncing feeling. See deformScale())
xScale = Approach(xScale,1,0.03);
yScale = Approach(yScale,1,0.03);

// Update state properties
image_xscale = facing*xScale;		// Player sprite always looks on facing direction. And update xScale deformation 
image_yscale = yScale;				// Update yScale deformation

// Update Player depth
setPlayerDepth();

// COLLISIONS AND POSITION UPDATE ------------------------- //

if state != DEAD
{
	//Z Collisions
	repeat(abs(vz)) {
		if !position_meeting_3d(x, y, z + sign(vz), oParSolid)
			z += sign(vz);															// ..update z position
		else {
			vz = 0;
			break;
		}
	}
	// Horizontal
	repeat(abs(vx)) 
	{  
	    // X Update
	    if !position_meeting_3d(x + sign(vx), y, z, oParSolid)					// If player don't collide left or right..
		and (x + sign(vx) <= camera_get_view_x(cam) + camera_get_view_width(cam)) and (x + sign(vx) >= camera_get_view_x(cam)		// ...is inside the camera boundaries..
		and ((state != HIT1 and state != HITHARD and state != HITWEAPON) or !onGround))				// ...and is not in a hitting state...
		and state != HURT														// ...nor in HURT state...
		{
			if (kDown or kUp)													// ..if combined with vertical input
				x += sign(vx)/1.3;												// ..update x position (tweaked to not combine vertical + horizontal speeds)
			else
				x += sign(vx);													// ..update x position at full
		}
		else { 																	// BUT if he collides..
			vx = 0;																// ..can't go further...
			break;
		}
	}
	// Vertical Walking
	repeat(abs(vy)) {
	    if !position_meeting_3d(x, y + sign(vy), z, oParSolid)					// If player don't collide under or above with solids..
		and !position_meeting(x, y + sign(vy), oBgCollider)						// Don't collide vertically either with Background Collider
		and (y + sign(vy) <= camera_get_view_y(cam) + camera_get_view_height(cam)) and (y - sprite_height + sign(vy) >= camera_get_view_y(cam)		// Is inside the camera boundaries..
		and ((state != HIT1 and state != HITHARD and state != HITWEAPON) or (!onGround and vy = 0)))				// ...is not in a hitting state OR is making an air kick but not moving on Y...
		and state != HURT														// ...and is not in HURT state...
		{																		// ..will be able to move vertically!
			if (kRight or kLeft)												// In case that both vertical and horizontal inputs at the same time...
				y += sign(vy)/1.3;												// ..update y position with a tweak to not addition vertical + horizontal speeds.
			else																// In case of a single movement input...
				y += sign(vy);													// ..update y position at full
		}
		else {																	// BUT if he collides..
			vy = 0;																// ..can't go further..
			break;
		}
	}
}
// -------------------------------------------------------- //

