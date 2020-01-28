/// @description Retreat for a while
spd = Approach(spd, maxH, groundAccel);								// increase the speed to max in RETREAT state

if spd > 0				// if speed is over 0...
{
	if !flee			// ..and don't need to flee (means that enemy don't collide with any oParSolid)
		move_towards_point(retreatX, retreatY, spd*spdMult);					// ...can move in retreat at halfspeed
	else
		move_towards_point(dirX, dirY, spd*spdMult);							// But if enemy collided with a oParSolid, runs out of it at half speed
}
else
{
	speed = 0;
	state = IDLE;
}
