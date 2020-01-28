/// @description Back To Title Screen
// You can write your code in this editor
instance_destroy();
audio_stop_all();
global.pause = 0;
room_goto(rTitleScreen);