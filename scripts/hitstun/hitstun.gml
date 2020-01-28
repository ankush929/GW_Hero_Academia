/// @description hitstun(Milliseconds, objectToHitstun);
/// @param Milliseconds

var character = argument1;

character.alarm[6] = argument0;		// Set the duration of hitstun
character.hitstuned = 0;			// hitstun this character. (freeze the animations and avoid movement for a while)
