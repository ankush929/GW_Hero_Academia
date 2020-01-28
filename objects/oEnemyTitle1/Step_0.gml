/// @description Insert description here
// You can write your code in this editor
if(checkIndex)
{
	if (image_index > 12)
	vanishTitle = true;
}

if(vanishTitle)
{
	image_index = 13;
	image_alpha -= 0.01;
	if image_alpha <= 0
	{
		instance_destroy()
	}
}

if(global.die)
{
	alarm_set(0,1)
}