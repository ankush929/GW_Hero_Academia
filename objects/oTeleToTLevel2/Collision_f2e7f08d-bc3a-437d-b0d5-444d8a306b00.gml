/// @description Transport Player to next Level
// You can write your code in this editor
if(instance_number(oBattleArea) == 0)
{
	audio_stop_all();
	room_goto(rChapter2);
}