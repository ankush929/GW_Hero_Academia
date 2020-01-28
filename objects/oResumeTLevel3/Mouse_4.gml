/// @description Insert description here
// You can write your code in this editor
instance_activate_all()
audio_resume_all()
instance_deactivate_object(oExitButton);
instance_deactivate_object(oRestartTLevel3);
instance_deactivate_object(oPauseTitle);
instance_destroy();
global.pause = 0;