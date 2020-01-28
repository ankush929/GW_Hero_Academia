/// @description Movement and behaviours

// ---- Movement
vx = Approach(vx, 0, 0.5);	// vx decrease possible knockbacks
grabbable = false;
// -------------

// ---------- Enemy behaviour --------------
event_user(0);					// Choose state

///States machine
switch (state) {
    case IDLE:
		event_user(1);			// Animate according state
		event_user(2);			// Choose opponent and face
    break;
    
    case RUN: 
        event_user(1);			// Animate according state
		event_user(3);			// Chase opponent
    break;
	
	case HIT: 
        event_user(1);			// Animate according state
    break;
	
	case HURT: 
        event_user(1);			// Animate according state
    break;
    
	case WAIT: 
        event_user(1);			// Animate according state
		event_user(2);			// Choose opponent and face
    break;
	
	case KO: 
        event_user(1);			// Animate according state
    break;
	
	case RECOVER: 
        event_user(1);			// Animate according state
    break;
	
	case RETREAT:
		event_user(1);			// Animate according state
        event_user(4);			// Retreat for a while
    break;
	
	case GRABBED:
		event_user(1);			// Animate according state
    break;
	
    case DEAD: 
        event_user(1);			// Animate according state
    break;
}
// -----------------------------------------


