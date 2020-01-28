/// @description Init players
// ----- CHARACTER properties ---------------------------------- //
#region Movement and Jump vars
vx = 0;
vy = 0;
vz = 0;
z = 0;
xScale = 1;									// Will use this to deform Player sprite if need (for smooth gameplay purposes)
yScale = 1;									// See deformScale() use and where to use it
// Acceleration + friction
accel		= 1;							// Depending if we're onGround or not...
fric		= 0.5;							// ...we will apply gound values or air values
// Max movement speeds
maxVX       = 3.0;
maxVY       = 2.0;
maxVZ       = 15.0;
// Jump and gravity variables
jumpHeight  = 14.0;
gravRise    = 1.5;							// Gravity value while jumping up
gravFall    = 0.25;							// Gravity value while falling
// Input vars
onceStick = false;							// For gamepad controls check stick one single time
#endregion
#region Combat vars
hit = false;
hitCounter = 0;								// Counts every hit until reach hitHardMax
hitHardMax = 5;								// Determines how many hit need to make a HITHARD
damage = 1;									// Init how much damage can make a Hit
opponent = -1;
hitstuned = 1;								// Hitstun will be used to allow or block character actions and/or move
weapon = "";
weaponId = 0;
weaponType = "";							// Can be "fixed" or "thrown"
wResistance = 0;							// Set the resistance of a weapon before it breaks
lowkb = 2;									// Depending on Hit we will apply low knockback to the opponent
highkb = 10;								// Depending on Hit we will apply high knockback to the opponent
// Hit lag and hit stun according hits
hit1lag = 5;													// Time between basic hits
hithardlag = 25;												// Time after a HITHARD
hitweaponlag = 15;												// Time after a HITWEAPON
#endregion
#region Pick, Grab and Throw
// Pick properties
canHit = true;								// Can hit	(for hitlag)
canPick = true;								// Can pick items	(for pickstun)
pickstun = room_speed;						// pickstun duration
// Grab properties
grabbedId = -1;								// Will store the instance Id of the grabbed opponent (Don't change this)
grabRight = false;							// Will check if is possible to grab from the right (Don't change this)
grabLeft = false;							// Will check if is possible to grab from the left (Don't change this)
canGrab = false;								// Can grab objects and Opponents
grabbable = false;							// Opponents can grab this Player
throwForce = 15;							// Set the force of a Throw
#endregion
#region Life vars
maxLife = 30;
life = maxLife;
#endregion
// ----------------------------------------------------- //

// ----- COLLISION properties -------------------------------- //
#region Fake ground collisions 
//(See Begin Step to check if Player is grounded or no)
onGround = true;
onPlatform = false;
shadowZ = 0;
ray = -1;
actualPlatform = 0;							// Store an actual Z collision object
lastPlatform = 0;							// Store a temp Z collision object
#endregion
#region Char collision boxes
hurtBox = sHurtBox;							// Store the character collision mask
height = sprite_get_height(sHurtBox);		// Used to check collisions on Z axis above
#endregion
// ----------------------------------------------------- //

// ----- PLAYER STATES INFO ---------------------------- //
#region States
IDLE		= 10;
RUN			= 11;
JUMP		= 12;
HIT1		= 13;
HITHARD		= 14;
THROWWEAPON = 15;
HITWEAPON	= 16;
PICK		= 17;
DEAD		= 18;
HURT		= 19;
GRAB		= 20;
THROW		= 21;
SPECIAL		= 22;
#endregion
#region Facings
RIGHT =  1;
LEFT  = -1;
#endregion
// ---------------------------------------------------- //

// Initialize player's properties
playerId = string_digits(object_get_name(object_index));		// We extract the id in numbers from the object name. So, if the name is "oPlayer1", playerId is "1"
state  = IDLE;
facing = RIGHT;
dir = facing;													// direction where moving (may be different than facing direction!)

// Create Player/s shadow
shadow = instance_create_depth(x,y,depth,oCharShadow);
shadow.parId = id;

#region Debug properties
punch = -1;		// Store punch hitbox
kick = -1		// Store kick hitbox
#endregion