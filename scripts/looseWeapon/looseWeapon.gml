// Loose weapon mechanich

var char = argument[0];				
if char.weapon != ""				
{
	var objItem = asset_get_index("oItem" + char.weapon);
	lostWeapon = instance_create_depth(x,y - sprite_height/2,depth - 1, objItem);
	lostWeapon.vx = 2*-char.facing;		
	lostWeapon.vy = -4;				
	lostWeapon.dy = char.y;			
	lostWeapon.onGround = false;	
	char.weapon = "";				
	char.canPick = false;			
	char.alarm[7] = char.pickstun;	
}