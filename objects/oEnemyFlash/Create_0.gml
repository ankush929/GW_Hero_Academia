/// @description Init Enemy

// ----- ENEMY properties ---------------------------------- //
#region Movement vars
z = 0;
spd = 2;
vx = 0;
dirX = 0;
dirY = 0;
xScale = 1;									// Will use this to deform Player sprite if need (for smooth gameplay purposes)
yScale = 1;									// See deformScale() use and where to use it
// Acceleration + friction
groundAccel = 3.0;
groundFric  = 0.5;
// Max movement speeds
maxH        = 8.0;
maxV        = 6.5;
#endregion
// ----------------------------------------------------- //

// ----- COLLISION Properties -------------------------------- //
#region Relative collision checks
colLeft  = 0;
colRight = 0;
colUp	 = 0;
colDown	 = 0;
#endregion
// ----------------------------------------------------- //

// ----- ENEMY STATES INFO ---------------------------- //
#region States (Check User Event 1)
IDLE     = 10;
RUN      = 11;
HURT     = 12;
HIT      = 13;
WAIT     = 14;
DEAD     = 15;
RETREAT  = 16;
KO		 = 17;
RECOVER	 = 18;
GRABBED	 = 19;
#endregion
#region Facings
RIGHT =  1;
LEFT  = -1;
#endregion
	
// ----- BEHAVIOUR properties ----------------------- //
#region Behavioural chances (Check User Event 0)
chanceToWait = 5;
chanceToHit = 95;
chanceToRetreat = 0;
#endregion
#region Retreat vars (Check User Event 0 and then User Event 4)
retreatMax = 100;
retreatX = 0;
retreatY = 0;
#endregion
#region Chase vars (Check User Event 0 and then User Event 3)
minChaseDistance = sprite_width;
maxChaseDistance = 500;
#endregion
#region Hit vars
hit = false;
punch = -1;
opponent = -1;
hitstuned = 1;							// Hitstun will be used to allow or block character actions and/or move
#endregion
#region Hurt variables
timeToDisapear = 2;			// Time to wait to disapear after DEAD animation
vanish = false;				// vanish will allow to decrase the enemy image_alpha after timeToDisapear
koType = "";				// Set type of KO animation. Can be noone, "Push", "Up" or "Thrown"
#endregion
#region Grab & Throw vars
grabbable = false;			// Opponents can grab this Enemy
grabbed = false;			// Init grabbed to false
grabberId = -1;				// // Will store the instance Id of the grabbing opponent (Don't change this)
thrown = false;				// Init thrown to false
#endregion

// Initialize enemy's properties
state  = IDLE;
facing = LEFT;
nearestOpponent = -1;									// This var will store which Player is nearest (processed in User Event 2)
dirChange = false;
maxLife = 10;
life = maxLife;
grabbable = true;										// Opponents can grab this Player
showInfo = false;										// Hide enemies healthbar
flee = false;											// flee is for avoid collision with walls. Init to false (true when enemy collides with oParSolid)
spdMult = 1;											// Will be used to manage the speed of animations

// Set Enemy name
enemyName = assignName();

// Set Battle areas
if instance_exists(oBattleArea) and place_meeting(x,y,oBattleArea)		// Check if user has placed Battle areas to avoid crashes! 
	myBattleArea = instance_place(x,y,oBattleArea);		// Set at which Battle area belongs this enemy
else 
	myBattleArea = -1;

