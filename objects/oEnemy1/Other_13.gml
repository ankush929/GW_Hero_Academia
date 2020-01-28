/// @description Chase opponent
if instance_exists(nearestOpponent)
{
	spd = Approach(spd, maxH, groundAccel);			// increase the speed to max in RUN state
	if spd > 0										// if speed is over 0...
	and hitstuned != 0
	{
		if !flee									// ..and don't need to flee (means that enemy don't collide with any oParSolid)
			move_towards_point(nearestOpponent.x + sprite_get_width(nearestOpponent.hurtBox)*nearestOpponent.facing, nearestOpponent.y, spd);	// ..enemy can run chasing Players.
		else
			move_towards_point(dirX, dirY, spd*spdMult);	// But if enemy collided with a oParSolid, runs out of it at half speed
	}
	else
		speed = 0;									// If spd = 0, we set speed = 0, to stop move_towards_point function.
}