/// @description Insert description here
// You can write your code in this editor
if(global.downPressed == 1)
{
	image_index = 1
	global.downPressed = 0;
}
else {
	image_index = 0
}


var vx = camera_get_view_x(view_camera[0]) + 64;
var vy = camera_get_view_y(view_camera[0]) + 370;

x =vx;
y = vy;