/// @description Previous frame checks

// Check opponent collisions for grab
grabRight = position_meeting(x + 1, y, oParEnemy);
grabLeft = position_meeting(x - 1, y, oParEnemy);

// Check onGround
if (z + vz > 0)			// If z position plus vz speed is bigger than 0, means that we reached the ground
and !onGround
{
	onGround = true;		// So player is onGround
	deformScale(1.3,0.7,id);	// Squash sprite onGround for better gameplay feel

	// Dust FX
	addParticles(3, x, y + z + 5, irandom_range(-1, 1), 0, random_range(0.5,1), make_color_hsv(0,0,irandom_range(100,130)), 1, depth + choose(1,-1), 30, true, sDust, 0, 0, false);
	
	vz = 0;				// In this case, we set our vz to 0...
	z = 0;				// ...and the z position to 0 too
	shadowZ = z;		// as with the shadowZ
	onPlatform = false;	// and set that player is not onPlatform, simply onGround
}

// Store actual platform (temporary) ------------
if position_meeting_3d(x, y, z + sign(vz), oParSolid)
	actualPlatform = instance_position(x, y, oParSolid).parId;
// ----------------------------------------------

// Check onPlatform
if position_meeting_3d(x, y, z + sign(vz), oParSolid)	// If player is over a platform
{
	// Dust FX and Squash onGround
	if !onGround
	{
		addParticles(3, x, y + z, irandom_range(-1, 1), 0, random_range(0.5,1), make_color_hsv(0,0,irandom_range(100,130)), 1, depth - 100, 30, true, sDust, 0, 0, false);
		deformScale(1.2,0.8,id);	// Squash sprite onGround for better gameplay feel
	}
		
	onGround = true;									// ..then is grounded..
	onPlatform = true;									// ..over a platform..
	lastPlatform = instance_position(x, y, oParSolid).parId;	// ..this one specifically.. (will use this to manage shadow placement)
	shadowZ = z;										// .. and the shadow z is the same than the player z
}
else if (z + vz < 0)									// But if not over a platform
	onGround = false;									// ..Player is not grounded anymore

// Reset GRABBED if opponent was separated for some reason
if state = GRAB and (!position_meeting(x + facing, y, oParEnemy) or (grabbedId.state = grabbedId.DEAD))
{
	canGrab = true;
	state = IDLE;
}

// IDLE state after this cases
if state = RUN or state = JUMP
	state = IDLE;