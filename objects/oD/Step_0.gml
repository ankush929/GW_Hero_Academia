/// @description Insert description here
// You can write your code in this editor
if(global.DPressed == 1)
{
	
	image_index = 1
	global.DPressed = 0;
	
} else {
	
	image_index = 0
}

var vx = camera_get_view_x(view_camera[0]) + 672;
var vy = camera_get_view_y(view_camera[0]) + 356;

x =vx;
y = vy;