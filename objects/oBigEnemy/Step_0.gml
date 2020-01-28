/// @description Insert description here
// You can write your code in this editor
var reverse = keyboard_check(vk_space)

if(!pressedSpaceOnce){
if(reverse)
{
	changeColor = true
	pressedSpaceOnce = true
}
}

if(changeColor)
{
	alarm_set(2, 20);
	changeColor = false
}

if(global.shake){
    __angle=random_range(-shakeForce,shakeForce)
    camera_set_view_angle(view_camera[0],__angle);
}else{
    camera_set_view_angle(view_camera[0],0);
}

if(global.enemiesLeave)
{
	if(image_alpha> 0)
	{
	image_alpha -=0.01
	}
	
	y = y-2;
	
	if(y<0)
	{
		instance_destroy()
		global.enemiesLeave = false
		global.finalComicScene = true
	}
}