/// @description Draw Enemy, shadow, GUI and Debug info 

// Calc and draw shadow_size according the z value. At more negative z (higher jump), less shadow size
shadow_size = clamp(abs((y+(z*5))/y), 0, 1);		
draw_sprite_ext(sCharShadow, image_index, x, y, shadow_size, shadow_size, 0, c_black, image_alpha);

// Draw Enemy sprite taking into account the z value (for jumps)
draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

#region Display Name and HealthBar
// HealthBar vars
var barExtSprite = sExtHealthBar;
var barSprite = sHealthBar;
var barPositionY = camera_get_view_y(cam) + 30;
var lifeGUI = clamp(life,0,maxLife);

if showInfo
{
	// Draw Enemy's name
	draw_set_font(normalText);
	draw_text_outlined(camera_get_view_x(cam) + camera_get_view_width(cam) - 20 - string_width(enemyName), barPositionY - string_height(enemyName), enemyName, c_orange, c_maroon, 1,1,0,1,20);
	draw_set_font(-1);
	// Draw extarnal frame of the HealthBar
	draw_sprite(barExtSprite,0,camera_get_view_x(cam) + camera_get_view_width(cam)  - 20 - sprite_get_width(barExtSprite), barPositionY);
	// Draw Healthbar
	draw_sprite_ext(barSprite,0,camera_get_view_x(cam) + camera_get_view_width(cam) - 21, barPositionY + 1, -1 * (lifeGUI/maxLife), 1,0,c_white,1); // The bar sprite will decrease from left to right. This is why we multiply xscale *-1
}
#endregion


#region Debug info (No need to run the game, only used for debug purposes. Press "C" to activate/deactivate global.DebugGUIOn)
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
	
		case HIT: 
	        statename = "HIT";
	    break;
	
		case HURT: 
	        statename = "HURT";
	    break;
    
		case WAIT: 
	        statename = "WAIT";
	    break;
		
		case KO: 
	        statename = "KO";
	    break;
		
		case RECOVER:
			statename = "RECOVER";
	    break;
		
		case GRABBED:
			statename = "GRABBED";
	    break;
	
		case RETREAT:
			statename = "RETREAT";
	    break;
	
	    case DEAD: 
	        statename = "DEAD";
	    break;
	}
	#endregion
	
	draw_line(x - 30, y, x + 30, y);								// Draw a line where the enemy's "floor" is
	if instance_exists(nearestOpponent)
		draw_line_color(x, y, nearestOpponent.x, nearestOpponent.y,c_maroon,c_blue);			// Draw a line beatween Enemy and the nearestOpponent
	draw_sprite(sHurtBox,0,x,y + z);								// Show the enemy's collision box
	if hit and state = HIT											// Show oPlayerHitBox. This is for debug but not accurate...
		draw_sprite(sHitBox,0, x + (sprite_get_width(sHitBox)/2)*facing, y + z - sprite_height/2);	// ...the real oPlayerHitBox lasts only 0,016 seconds but we draw it for debug reasons for a little bit more
	draw_text(x - string_width(statename)/2, y + 5, statename);		// Show the name of the actual state 
}
#endregion
