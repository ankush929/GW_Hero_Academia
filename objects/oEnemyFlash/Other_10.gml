/// @description Choose state
#region behaviours
if instance_exists(nearestOpponent)						// Only choose an state after finding a nearestOpponent. If there's no opponents, enemies won't do anything 
and hitstuned != 0
{														// (Find nearestOpponent at User Event 2)
	if state != DEAD and state != KO and state != HURT	// Except for DEAD, KO and HURT states, face always to the nearestOpponent
	and state != RECOVER
	{
		facing = sign(nearestOpponent.x - x);		// facing depends on the X position relative to the opponent x position
		if facing = 0								// Tweak facing cause never can be 0
			facing = 1;
	}
	switch (state)
	{
		case IDLE:									// During the IDLE state is when enemies take most of their decisions
		{	
			// WAIT decision
			if percent_chance(chanceToWait)			// This is a custom script that checks the chance in given percentage
			{
				state = WAIT;						// If chances are inside chanceToWait value we go to WAIT state
				image_index = 0;					// Reset the animation
				alarm[3] = room_speed*2;			// And put an alarm that lasts 2 seconds. This alarm will end the WAIT
			}
			// RUN and chase decision
			else if oGame.inBattleArea				// Only chase Players if the Camera is inBattleArea
			and ((nearestOpponent != -1) and ((abs(y - nearestOpponent.y) > EnemyLayerSize) or (abs(x - nearestOpponent.x) > minChaseDistance)) and abs(x - nearestOpponent.x) <= maxChaseDistance)	// (EnemyLayerSize is a macro var that determines Min Y distance between Enemy and Player to make enemies decide to attack)
			{										// If chances were not in chanceToWait, we check if enemy is far enough from any Player... 
				state = RUN;						// ...to RUN to her
				image_index = 0;					// Reset the animation
				alarm[3] = -1;						// reset the WAIT alarm in case it was active
			}
			// HIT decision
			else if (nearestOpponent != -1) and (abs(y - nearestOpponent.y) <= EnemyLayerSize) and (abs(x - nearestOpponent.x) <= minChaseDistance)
			and percent_chance(chanceToHit)			// If chances were not in chanceToWait but are in chanceToHit, we check if enemy is near enough from any Player... 
			{
				state = HIT;						// ...to RUN to her
				image_index = 0;					// Reset the animation for every punch
				alarm[3] = -1;						// reset the WAIT alarm in case it was active
			}
			spdMult = 1;							// In IDLE, reset the animation spdMult
		}
		break;
		case RUN:									// During the RUN state enemies decide either to suddenly WAIT or go back to IDLE to take new decisions
		{
			var i;
			for (i = 0; i < instance_number(oParEnemy); i++)		// First we check for all the other enemies "alive"...
			{
				otherEnemies[i] = instance_find(oParEnemy,i);		// ...and store them in an array
			
				if ((abs(otherEnemies[i].y - nearestOpponent.y) <= EnemyLayerSize) 
				and (abs(otherEnemies[i].x - nearestOpponent.x) <= minChaseDistance)) and otherEnemies[i].id != id		// If another enemy is next to the nearestOpponent... 
				{
					state = WAIT;						// ...this enemy waits
					image_index = 0;					// Reset the animation
					alarm[3] = room_speed*2;			// And put an alarm that lasts 2 seconds. This alarm will end the WAIT state
				}
				else
				{
					if (nearestOpponent = -1) or ((nearestOpponent != -1)				// But if this enemy faces his nearestOpponent...
					and (abs(y - nearestOpponent.y) <= EnemyLayerSize) and (abs(x - nearestOpponent.x) <= minChaseDistance))
					{
						spd = Approach(spd, 0, groundFric);								// ...stops in front of the Player...
						state = IDLE;													// ...and goes to IDLE to take new decisions
						alarm[3] = -1;													// reset the WAIT alarm in case it was active
					}
				}
			}
		}
		break;
		case HURT:									// In HURT state we will simply check if the enemy received enough hits to go to RETREAT, 
		{											// ...otherwise at the end of animation, the enemy will go IDLE to take new decisions
			if image_index >= image_number-1
			{
		        image_speed = 0;
				if grabbed							// If after a HIT the enemy is still grabbed
					state = GRABBED;				// go back to GRABBED state
				else								// In any other case...
				{
					if (state != RETREAT)												// If the chanceToRetreat acomplishes its percent chance, we prepare the RETREAT state
					and percent_chance(chanceToRetreat)
					{
						retreatX = x + retreatMax*(-facing);							// Retreat from player
						retreatY = y + irandom_range(retreatMax, -retreatMax)			// Retreat can also go up or down within a range of verticallity
						alarm[3] = -1;													// reset the WAIT alarm in case it was active
						state = RETREAT;												// go to RETREAT state
						spdMult = 0.5;													// In RETREAT, animation runs half of its speed
					}
					else
						state = IDLE;													// But if no chanceToRetreat enough, go back to IDLE
				}
			}
		}
		break;
		case RETREAT:								// While RETREAT we only check if the enemy has reached his max retreat distance
		{
			chanceToRetreat = 0;													// ...reset retreatCounter
			if (abs(x - retreatX) <= 1) or (abs(y - retreatY) <= 1)					// If enemy reaches the max retreat distance...
				state = IDLE;														// ...and go back to IDLE state
		}
		break;
		case HIT:
			speed = 2;
		break;
		case KO:									// In KO we assure that enemy can't move anymore.
			speed = 0;
		break;
		case RECOVER:								// In RECOVER we assure that enemy can't move anymore. No more Decisions
			speed = 0;
		break;
		case GRABBED:								// In RECOVER we assure that enemy can't move anymore. No more Decisions
			speed = 0;
		break;
		case DEAD:									// In DEAD we assure that enemy can't move anymore.
			grabbable = false;
			speed = 0;
		break;
	}
}
#endregion