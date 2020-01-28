if weapon != ""										// If we are attacking with a weapon...
{
	image_index = 0;
	if weaponType = "fixed"
		state = HITWEAPON;
	else if weaponType = "thrown"
		state = THROWWEAPON;
			
}
else														// If don't have a weapon do nude hands HITS
{
	hitCounter++;											// Increase the HITHARD counter
	alarm[1] = 30;											// alarm[1] manages how much time left to combo hits until a hard punch
	// Hard punch
	if (hitCounter > 0) and (hitCounter mod hitHardMax = 0) // If hitCounter reaches hitHardMax, automatically make a HITHARD instead than a HIT1
	and onGround											// A HITHARD only can be made when onGround
	{
		image_index = 0;									// Reset the animation for every hit
		state = HITHARD;									// Go to HITHARD state
		hitCounter = 0;										// Reset hitCounter
		damage = 2;
	}
	else													// In case that hitCounter don't reach hitHardMax yet, make a usual HIT1
	{	
		image_index = 0;									// Reset the animation for every hit
		state = HIT1;										// Go to HIT1 state
		damage = 1;
		if !onGround										// Air kick situation
			vz = -jumpHeight/4;								// Make a slight hover when air kick
	}
}