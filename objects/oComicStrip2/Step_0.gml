/// @description Insert description here
// You can write your code in this editor
var reverse = keyboard_check(vk_space)

if(reverse)
{
	instance_destroy(space)
	goReverse = true
}

if(x < 450)
{
	stop = true
}

if(!stop)
{
	x-=5
}

if(goReverse){
	x+=10
	if(x>1024)
	{
		instance_destroy()
	}
}