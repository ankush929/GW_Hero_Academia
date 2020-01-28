/// @description Insert description here
// You can write your code in this editor
resX = camera_get_view_x(cam)
resY = camera_get_view_y(cam)
/*show_debug_message(resX);
show_debug_message(resY);*/
if(flag)
{
	//audio_pause_all();
	instance_deactivate_all(true);
	instance_create_depth(resX + 300,resY + 50,-500,oBossTitle4);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_sprite(sFlash,0,resX + 100, resY + 50);
	//draw_sprite(sGamePaused,0,resX + 700,200)
	
}