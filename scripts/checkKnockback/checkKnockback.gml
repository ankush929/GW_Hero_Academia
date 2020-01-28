/// Manage Knockback

if damage = 1							// If the hit box received is low damaging...
	other.vx = parentId.lowkb*parentId.facing;
else									// But if it is hard damaging (any value over 1)...
{
	if parentId.state = parentId.HITWEAPON
	{
		other.vx = parentId.lowkb*parentId.facing;			// A hit with weapon has low knockback
		other.koType = "";
	}
	if parentId.state = parentId.HITHARD
	{
		other.vx = parentId.highkb/1.25*parentId.facing;	// A hithard has heavy knockback
		other.koType = "Up";
	}
	if parentId.state = parentId.HIT1
	{
		other.vx = parentId.highkb*1.25*parentId.facing;	// An Air Kick has heavy knockback
		other.koType = "Push";	
	}
	if parentId.state = parentId.SPECIAL
	{
		other.vx = parentId.highkb*1.35*-other.facing;		// An Special move has most heavy knockback
		other.koType = "Push";	
	}
}