/// @description Insert description here
// You can write your code in this editor

image_xscale = 0.25
image_yscale = 0.25
if(descend)
{
	y +=2
}

if(y == oPlayer1.y - 80)
{
	descend = false
	global.shake = false
	showScreen = true
	image_index = 1
}

if(showScreen)
	{
		alarm_set(0,1)
		showScreen = false
	}
	
if(global.finalComicScene)
{
	alarm_set(1,1)
	global.finalComicScene= false
}