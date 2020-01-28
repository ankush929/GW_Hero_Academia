addParticles(0, x + (sprite_width/2*parentId.facing), y + random_range(5,-5), 0, 0, 0.5*damage, c_white, 0.75, other.depth - 1, 1*damage, true, sHitParticle, 0, 0, true);		// Hit particles
hitstun(5, other);							
		
if parentId.weapon != ""					
	weaponDurability(parentId)				
			
checkKnockback();							
		
if other.life > damage						
{
	audio_play_sound(Punch1,10,false);
	other.chanceToRetreat+=10;				
	if (damage = 1	)						
	{
		other.state = other.HURT;			
	}
	else									
	{
		other.image_index = 0;
		other.state = other.KO;				
		audio_play_sound(PunchHard,10,false);
	}
}
else										
{
	other.state = other.DEAD;				
	//audio_play_sound(Punch1,10,false);
	audio_play_sound(Death,10,false);
	other.alarm[4]= room_speed*other.timeToDisapear;	
}
		
other.facing = -parentId.facing;			
other.life -= damage;						
deformScale(0.9,1.1,other);					
other.image_index = 0;						
		

if !parentId.onGround							
	parentId.vx = parentId.vx/2;				
		

if !position_meeting(parentId.x + 5*sign(parentId.facing), parentId.y, oParSolid)			// If Player won't collide with any solid wall
	parentId.x += 5*parentId.facing;						// Player advance slightly
	


oParEnemy.showInfo = false;			
other.showInfo = true;				