/// @description Draw Player, shadow, GUI and Debug info 
// Draw Player sprite taking into account the z value (for jumps)
draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
//draw_text_color(x, y - sprite_height - string_height("!") + z, "z: " + string(z) + "|shadowZ: " + string(shadowZ), c_white,c_white,c_white,c_white,image_alpha);		// Only for debug purposes

#region Display Name and HealthBar

// HealthBar vars
var barExtSprite = sPlayerExtHealthBar;
var barSprite = sPlayerHealthBar;
var barPositionX = camera_get_view_x(cam) + 20;/* + (sprite_get_width(barExtSprite) + 20)*(real(playerId) - 1);*/		// This is the upper right corner
var barPositionY = camera_get_view_y(cam) + 30;
var lifeGUI = clamp(life,0,maxLife);

// Draw Player's name
draw_set_font(normalText);
draw_text_outlined(barPositionX, barPositionY - string_height(playerName), playerName, c_yellow, c_black, 1,1,0,1,20);
draw_set_font(-1);
// Draw extarnal frame of the HealthBar
draw_sprite(barExtSprite,0,barPositionX, barPositionY);
// Draw Healthbar
draw_sprite_ext(barSprite,0, barPositionX + 1, barPositionY + 1, 1 * (lifeGUI/maxLife), 1,0,c_white,1); // The bar sprite will decrease from left to right. This is why we multiply xscale *-1

#endregion

#region Debug Info		// (No need to run the game, only used for debug purposes. Press "C" to activate/deactivate global.DebugGUIOn)
if global.DebugGUIOn
{
	#region state names
	var statename = "";
	switch (state) {
	    case IDLE:
			statename = "IDLE";
	    break;
    
	    case RUN: 
	        statename = "RUN";
	    break;
	
		case HIT1: 
	        statename = "HIT 1";
	    break;
		
		case HITHARD: 
	        statename = "HIT HARD";
	    break;
		
		case HITWEAPON: 
	        statename = "HIT WEAPON";
	    break;
		
		case THROWWEAPON: 
	        statename = "THROW WEAPON";
	    break;
		
		case PICK: 
	        statename = "PICK";
	    break;
		
		case GRAB: 
	        statename = "GRAB";
	    break;
	
		case HURT: 
	        statename = "HURT";
	    break;
	
	    case DEAD: 
	        statename = "DEAD";
	    break;
	}
	#endregion
	draw_line(x - 30, y, x + 30, y);								// Draw a line where the player's "floor" is
	draw_sprite(sHurtBox,0,x,y + z);								// Show the Player's collision box
	if canHit														// Show oPlayerHitBox. This is for debug but not accurate...
	{																// ...the real oPlayerHitBox lasts only 0,016 seconds but we draw it for debug reasons for a little bit more
		if (state = HIT1 or state = HITHARD)
		{
			if onGround
				draw_sprite(sHitBox,0, x + (sprite_get_width(sHitBox)/2)*facing, y + z - (sprite_height/2 + 5));
			else
				draw_sprite_ext(sHitBox,0, x + (sprite_get_width(sHitBox)/2)*facing, y + z - (sprite_height/2 + 5) + 20, 1, 1.5, 0, c_white, 1);
		}
		else if state = HITWEAPON and weapon != ""
			draw_sprite_ext(sHitBox,0, x + (sprite_get_width(sHitBox)/2 + 14)*facing, y + z - (sprite_height/2 - 10), 1.8, 2.5, 0, c_white, 1);
	}
	draw_text(x - string_width(statename)/2, y + 5, statename);		// Show the name of the actual state 
	if global.friendlyFire
	{
		draw_circle_color(x,y + z - sprite_get_height(sHurtBox) - 12, 9, c_red, c_red, false);
		draw_set_halign(fa_center);
		draw_text_color(x, y + z - sprite_get_height(sHurtBox) - string_height("!"), "!", c_white,c_white,c_white,c_white,image_alpha);
		draw_set_halign(fa_left);
	}
}
#endregion
// ------------------------------------