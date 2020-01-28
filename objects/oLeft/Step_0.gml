/// @description Insert description here
// You can write your code in this editor
if(global.leftPressed == 1)
{
	image_index = 1
	global.leftPressed = 0;
}
else {
	image_index = 0
}

var vx = camera_get_view_x(view_camera[0]) + 16;
var vy = camera_get_view_y(view_camera[0]) + 320;

x =vx;
y = vy;