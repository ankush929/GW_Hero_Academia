/// @description Movement, actions and states management
// ----- Movement ------
if state != DEAD
{
	checkInput();											
	#region Movement										
	if state = IDLE or state = RUN or state = JUMP			
	{
		// Left 
		if (kLeft and !kRight)
		{
			facing = LEFT;                                 
			if (vx > 0)
			    vx = Approach(vx, 0, fric);					
			vx = Approach(vx, -maxVX, accel);				
        
			if (onGround)
			    state = RUN;								
		}

		// Right 
		if (kRight and !kLeft)
		{
			facing = RIGHT;                                
			if (vx < 0)
			    vx = Approach(vx, 0, fric);					
			vx = Approach(vx, maxVX, accel);				
        
			if (onGround)
			    state = RUN;                                
		}
		// Down 
		if (kDown and !kUp)
		{
			if (vy > 0)
			    vy = Approach(vy, 0, fric);					
			vy = Approach(vy, maxVY, accel);				
        
			if (onGround)
			    state = RUN;								
		}

		// Up 
		if (kUp and !kDown)
		{
			if (vy < 0)
			    vy = Approach(vy, 0, fric);					
			vy = Approach(vy, -maxVY, accel);				
        
			if (onGround)
			    state = RUN;								
		}
	}
	#endregion
}
	#region Gravity											
	if (!onGround){
		if state = IDLE or state = RUN
			state = JUMP;
		// Make player fall
		if (vz < 0)
		{
			vz = Approach(vz, 0, gravRise);					
		}
		else
		{
			vz = Approach(vz, maxVZ, gravFall);				
		}
	}
	#endregion
#region Resets and No Inputs
// No moving inputs
if (!kRight and !kLeft) or (kRight and kLeft)
    vx = Approach(vx, 0, fric);								// Slide and brake when not moving or when pressing oposite inputs at the same time
if (!kDown and !kUp) or (kDown and kUp)
    vy = Approach(vy, 0, fric);								// Slide and brake when not moving or when pressing oposite inputs at the same time
// Reset grab if no near collisions
if (!grabRight and !grabLeft) and weapon = ""
{
	grabbedId = -1;
	canGrab = true;
}
#endregion
// ---------------------

// ----- Actions -------
if (kHit1)													
{
	#region Grab											
	if ((kHit1 and grabRight and kRight) or (kHit1 and grabLeft and kLeft))					// If ActionButton + DirectionButton when colliding whith an enemy...
	and (state != JUMP and weapon = "") 						// Can't grab while in Jump neither with a weapon
	{
		/*if canGrab												// ..and Player is not grabbing anything...
		{
			grabbedId = instance_position(x + facing, y, oParEnemy);	// ..get the Id of the opponent to grab...
			if instance_exists(grabbedId)
			{
				if grabbedId.grabbable										// ..and check if its grabbable. If it is...
				and abs(grabbedId.depth - depth) <= EnemyLayerSize 
				and abs(grabbedId.y - y) <= EnemyLayerSize					// Check if Player and Opponent are in the depth and Y range to receive hit
				and grabbedId.state = grabbedId.IDLE or grabbedId.state = grabbedId.RUN or grabbedId.state = grabbedId.WAIT or grabbedId.state = grabbedId.RETREAT	// Check that opponent is in an available state					// Check that opponent is out of HIT state
				{
					state = GRAB;											// ..GRAB it/him/her!
					canGrab = false;										// Can't grab anything more while grabbing
					vx = 0;													// Can't move either
					vy = 0;
					grabbedId.state = grabbedId.GRABBED;					// Set the opponent state to GRABBED
					grabbedId.grabbed = true;
					grabbedId.grabberId = id;					// Pass to the opponent which instance is grabbing him/her
					grabbedId.x = x + sprite_width/2;			// And reposition it/him/her to adapt to the animation
					oParEnemy.showInfo = false;					// Hide any other enemys HealthBar
					grabbedId.showInfo = true;					// Show the grabbed opponent HealthBar
				}
				else hitAction();
			}
		}*/
	}
	#endregion
	#region Pick											
	else if place_meeting(x,y,oParItem)						
	and canGrab
	{
		myItem = instance_place(x,y,oParItem);
		myItem.owner = id;
		if myItem.onGround									
		{
			hitCounter = 0;									
			image_index = 0;
			state = PICK;
			canHit = false;									
			canGrab = false;
			vx = 0;
			vy = 0;
		}
	}
	#endregion
	#region Hit												
	else if canHit											
	{
		hitAction();
	}
	#endregion
}
#region Special Move										
if (kHitSp)
{
	if life > 1	// Can't do a Special move if Player has not more than 1 life point
	{
		if canHit and onGround
		{
			audio_play_sound(SpecialAttack,10,false);
			image_index = 0;									
			state = SPECIAL;									
			hitCounter = 0;										
			damage = 3;
			life -= 1;											
		}
	}
}
#endregion
#region Throw												
if grabbedId != -1 and state = GRAB							
{
	if (kRightOnce and facing = LEFT) or (kLeftOnce and facing = RIGHT)	
	{
		grabbedId.thrown = true;							
		facing = kRightOnce - kLeftOnce;					
		grabbedId.vx = throwForce*facing;					
		grabbedId.image_index = 0;
		grabbedId.state = grabbedId.KO;						
		grabbedId.koType = "Thrown";						
		grabbedId = -1;										
		state = THROW;										
	}
}
#endregion
#region Jump												
if (kJump and onGround)										
and (state = RUN or state = IDLE)							
{
	audio_play_sound(Whoosh,10,false);
	onGround = false;
    vz = -jumpHeight;										
    state = JUMP;											
	hitCounter = 0;											
	deformScale(0.8,1.2,id);								
} 
#endregion
// ----------------------

// ----- States ---------
#region states												
switch (state) 
{
    case IDLE:
        image_speed = global.animFPS/2*hitstuned;										
        sprite_index = asset_get_index("sPlayer" + playerId + "Idle" + weapon);			
    break;
    
    case RUN: 
        image_speed = global.animFPS/2*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Run" + weapon);
    break;
	
	case HIT1:
		var xPos = x + (sprite_get_width(sHitBox)/2)*facing;
		var yPos = y + z - (sprite_height/2 + 5);
		if onGround && sprite_index != asset_get_index("sPlayer" + playerId + "HitAir")							
		{
			image_speed = global.animFPS*hitstuned;
			sprite_index = asset_get_index("sPlayer" + playerId + "Hit" + string((hitCounter mod 2)+1));		
			if image_index = 1 and canHit																		
			{
				punch = instance_create_depth(xPos,yPos,depth,oPlayerHitBox);									
				punch.parentId = id;																			
				punch.damage = damage;																			
				canHit = false;																					
				alarm[0] = hit1lag;																				
			}
		}
		else																									
		{
			image_speed = global.animFPS*hitstuned;
			sprite_index = asset_get_index("sPlayer" + playerId + "HitAir");
			if image_index = 2 and canHit																		
			{
				kick = instance_create_depth(xPos,yPos + 40,depth,oPlayerHitBox);								
				kick.parentId = id;																				
				kick.image_yscale = 1.5;
				kick.damage = damage*2;																			
				canHit = false;																					
				alarm[0] = hithardlag;																			
			}
		}
		
		if image_index > image_number-1																			
		{
			image_speed = 0;																					
			if onGround																							
			{
				if grabbedId = -1													
					state = IDLE;
				else					 											
					state = GRAB;
			}
		}
    break;
	
	case HITHARD:
		var xPos = x + (sprite_get_width(sHitBox)/2)*facing;
		var yPos = y + z - (sprite_height/2 + 5);
		
		image_speed = global.animFPS*hitstuned;
		sprite_index = asset_get_index("sPlayer" + playerId + "Hit3");
		
		if image_index = 1 and canHit							
		{
			punch = instance_create_depth(xPos,yPos,depth,oPlayerHitBox);		
			punch.parentId = id;												
			punch.damage = damage;												
			canHit = false;														
			alarm[0] = hithardlag;												
		}
		
		if image_index > image_number-1											
		{
            image_speed = 0;												
			state = IDLE;
		}
    break;
	
	case SPECIAL:
		var xPos = x;
		var yPos = y;
		
		image_speed = global.animFPS*hitstuned;
		sprite_index = asset_get_index("sPlayer" + playerId + "Special");
		
		if image_index = 2 and canHit							
		{
			special = instance_create_depth(xPos,yPos,depth,oScalingHitBox);	
			special.parentId = id;												
			special.damage = damage;											
			special.endXscale = 5.25;											
			special.endYscale = 7;												
			special.scaleSpdX = 0.25;											
			special.scaleSpdY = 0.35;											
			special.alarm[0] = 30;												
			canHit = false;														
			alarm[0] = hithardlag;												
		}
		
		if image_index > image_number-1											// Once the animations end, Player goes directly to IDLE state
		{
            image_speed = 0;												
			state = IDLE;
		}
    break;
	
	case THROWWEAPON:
		var xPos = x + (sprite_get_width(sHitBox)/2 + 14)*facing;
		var yPos = y - sprite_get_height(sHitBox)/2 + z;
		
		image_speed = global.animFPS*hitstuned;
		sprite_index = asset_get_index("sPlayer" + playerId + "Throw" + weapon);
		
		if image_index = 2 and canHit							
		{
			projectile = instance_create_depth(xPos,yPos,depth - 1,oMovingHitBox);								
			projectile.parentId = id;																			
			projectile.damage = damage;																			
			projectile.fakeYDisp = sprite_height/2;																
			projectile.weaponSprite = asset_get_index("s" + weapon);
			projectile.image_yscale = sprite_get_height(asset_get_index("s" + weapon))/sprite_get_height(sHitBox);
			projectile.spd = 4*facing;
			canHit = false;																						
			alarm[0] = hitweaponlag;																			
		}
		
		if image_index > image_number-1																		
		{											
			weapon = "";				// ..came back to animations without weapon
            image_speed = 0;
			state = IDLE;
		}
    break;
	
	case HITWEAPON:
		var xPos = x + (sprite_get_width(sHitBox)/2 + 14)*facing;
		var yPos = y + z - (sprite_height/2 - 10);
		
		image_speed = global.animFPS*hitstuned;
		sprite_index = asset_get_index("sPlayer" + playerId + "Hit" + weapon);
		
		if image_index = 1 and canHit							// From frame 1, begins the active phase to Hit
		{
			punch = instance_create_depth(xPos,yPos,depth - 1,oPlayerHitBox);		// Create the punch Hit box
			punch.image_xscale = 1.8;
			punch.image_yscale = 2.5;
			punch.parentId = id;																			// and store the Player instance id in de Hit box instance to know who made that hit
			punch.damage = damage;																			// Determines the damage that the hit box will make to enemies
			canHit = false;																					// Disable chance to Hit
			alarm[0] = hitweaponlag;																		// Hit lag time
		}
		
		if image_index > image_number-1																		// Once the animations end, Player goes directly to IDLE state
		{
			if wResistance <= 0				// If weapon broke...												
				weapon = "";				// ..came back to animations without weapon
            image_speed = 0;
			state = IDLE;
		}
    break;
    
    case JUMP:
        image_speed = global.animFPS*hitstuned; 
        // Jump and fall
        if (vz <= 0)																							// JUMP has two diferent animations
            sprite_index = asset_get_index("sPlayer" + playerId + "Jump" + weapon);										// The rising up animation...
        else
            sprite_index = asset_get_index("sPlayer" + playerId + "Fall" + weapon);										// ...and the falling one
            
        if image_index > image_number-1																			// Once the animations end, Player goes directly to IDLE state
            image_speed = 0;
    break;
	case PICK:
        image_speed = global.animFPS*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Pick" + weapon);									// The rising up animation...
		
		// Pick the item or replace the one we got by the new one
		#region pick and/or replace			
		if image_index = 2			// At the right frame start picking
		{
			if weapon != "" and myItem.weaponName != ""										
				instance_create_depth(x,y,depth-1, asset_get_index("oItem" + weapon))		
			// Now pick the new item
			if myItem.weaponName != ""								
			{
				weapon = myItem.weaponName;							
				weaponType = myItem.type;							
				weaponId = myItem;									
				damage = myItem.damage;								
				wResistance = myItem.resistance;					
			}
			with(myItem)											
				instance_destroy();
		}
		#endregion
		
        if image_index > image_number-1																			// Once the animations end, Player goes directly to IDLE state
		{
			canHit = true;
			state = IDLE;
            image_speed = 0;
		}
    break;
	case HURT: 
        image_speed = global.animFPS*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Hurt" + weapon);
		canHit = true;
		if image_index > image_number-1										// Once the animations end, Player goes directly to IDLE state
		{
            image_speed = 0;
			state = IDLE;
		}
    break;
	case GRAB: 
        image_speed = global.animFPS*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Grab");
		if image_index > image_number-1										// Once the animations end, Player goes directly to IDLE state
            image_speed = 0;
    break;
	case THROW: 
        image_speed = global.animFPS/2*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Throw");
		if image_index > image_number-1										// Once the animations end, Player goes directly to IDLE state
		{
			canHit = true;
            image_speed = 0;
			state = IDLE;
		}
    break;
	case DEAD:
		image_speed = global.animFPS*hitstuned; 
        sprite_index = asset_get_index("sPlayer" + playerId + "Die" + weapon);
		if image_index > image_number-1										// Once the animations end, destroy the Player instance (would mean Game Over)
		{
			global.playerLives--;
            image_speed = 0;
			instance_destroy();
		}
    break;
}
#endregion
// ----------------------