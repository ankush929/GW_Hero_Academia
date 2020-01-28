/// @description Insert description here
// You can write your code in this editor
var clickLeft = camera_get_view_x(cam) + 20;							//These four lines are to check the boundary of the pause button. Clicking within these bounds wil trigger the pause screen
var clickRight = clickLeft + (sprite_get_width(sPauseButton));
var clickTop = camera_get_view_y(cam) + 40;
var clickBottom = clickTop + (sprite_get_height(sPauseButton));
draw_sprite(sPauseButton,1,60,100);

if(mouse_y>clickTop && mouse_y<clickBottom)
{
	if(mouse_x>clickLeft && mouse_x<clickRight)
	{
		if(mouse_check_button_pressed(mb_left))
		{
			if(!global.pause)
			{
				global.pause=1
				instance_deactivate_all(true)
			}
		}
	}
}