/// @description Insert description here
// You can write your code in this editor
var reverse = keyboard_check(vk_space)

if(reverse)
{
	goReverse = true
}
if(x > 450)
{
	stop = true
	start = false
}

if(start)
{
if(!stop)
{
	x+=5
}
}

if(goReverse){
	x-=10
	
	if(x<0)
	{
		instance_destroy()
	}
}