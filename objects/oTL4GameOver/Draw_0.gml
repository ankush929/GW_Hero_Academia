/// @description Insert description here
// You can write your code in this editor
resX = camera_get_view_x(cam)
resY = camera_get_view_y(cam)
/*show_debug_message(resX);
show_debug_message(resY);*/
if(global.gameOver)
{
	instance_deactivate_all(true)
	instance_create_depth(resX+150,resY+70,-500,oGameOver);
	instance_create_depth(resX+150,resY+250,-500,oRestartTLevel4);
	instance_create_depth(resX+650,resY+250,-500,oExitButton);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,0);
	//draw_sprite(sGamePaused,0,resX + 700,200)
}