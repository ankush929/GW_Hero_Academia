/// @description Continue Countdown
if counterText > 0
{
	counterText--;
	alarm[1] = room_speed;
}
else
	global.gameOver = true;