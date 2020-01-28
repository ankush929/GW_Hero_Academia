/// @description Animate Enemy
// User Event 1 manages all enemy animations

switch (state) {
    case IDLE:
		image_speed = global.animFPS/2*hitstuned;
		sprite_index = sEnemyIdle;
    break;
	case RUN: 
        image_speed = global.animFPS/2*spdMult*hitstuned; 
        sprite_index = sEnemyRun;
    break;
	
	case HIT:														// Apart from animation, we create the enemy hitbox in an specific frame
		image_speed = global.animFPS*hitstuned * 2;
		sprite_index = sEnemyHit;
		if image_index >= 2 and !hit
		{
			hit = true;
			punch = instance_create_depth(x + sprite_get_width(sHitBox)/2*facing, y + z - sprite_height/2 - 5, depth + 1, oEnemyHitBoxFlash);		// Create the punch Hit box
			punch.parentId = id;
		}
		if image_index > image_number-1
		{
	        hit = false;
			state = IDLE;
		}
    break;
	
	case HURT: 
        image_speed = global.animFPS*hitstuned;
		if grabbed = false
			sprite_index = sEnemyHurt1;
		else
			sprite_index = sEnemyHurt2;
    break;
	
	case WAIT: 
		image_speed = global.animFPS/2*hitstuned;
		sprite_index = sEnemyIdle;
    break;
	
	case RETREAT: 
        image_speed = global.animFPS/2*spdMult*hitstuned; 
        sprite_index = sEnemyRetreat;
    break;
	
	case KO:
		image_speed = global.animFPS*hitstuned;											
		sprite_index = asset_get_index("sEnemyKo" + koType);
		
		if thrown and image_index = 5						// At 5th frame of a Thrown animation...
		{
			life -= 1										// ..got damaged
			addParticles(0, x, y + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Damage particles
		}
			
		if image_index > image_number-1						// At the end of animation
		{
	        image_speed = 0;
			if life <= 0									// If life is 0...
			{
				state = DEAD;								// ..Go to DEAD...
				vanish = true;								// ..and vanish
			}
			else if alarm[2] = -1							// Else prepare to go to RECOVER state
			{
				thrown = false;								// Reset thrown to false
				alarm[2] = room_speed;						// Wait 1 second to end the KO state
			}
		}
    break;
	
	case RECOVER:
		image_speed = global.animFPS*hitstuned; 
        sprite_index = sEnemyRecover;
		if image_index > image_number-1
		{
			addParticles(3, x, y + z + 5, irandom_range(-1, 1), 0, random_range(0.5,1), make_color_hsv(0,0,irandom_range(100,130)), 1, depth + choose(1,-1), 30, true, sDust, 0, 0, false);		// Dust FX
			image_speed = 0;
			state = IDLE;
			if grabbed
				grabbed = false;	// Reset grabbed flag
		}
	break;
	
	case GRABBED: 
        image_speed = global.animFPS/2*hitstuned; 
        sprite_index = sEnemyGrabbed;
    break;
    
    case DEAD:														// KO has a slight Knockback efect 
        image_speed = global.animFPS*hitstuned; 
        sprite_index = sEnemyDie;
		if image_index > image_number-1
	        image_speed = 0;
    break;
}
