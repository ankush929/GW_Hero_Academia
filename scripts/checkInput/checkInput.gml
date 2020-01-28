// Note that this script works with keyborad and pad inputs
// You can customize it if you wish.
// Input control vars

var dvc = 0;
if real(playerId) = 1 {
	kLeft        = keyboard_check(vk_left);
	global.leftPressed = kLeft
	
	kRight       = keyboard_check(vk_right);
	global.rightPressed = kRight
	
	kDown		 = keyboard_check(vk_down);
	global.downPressed = kDown
	
	kUp			 = keyboard_check(vk_up);
	global.upPressed = kUp
	
	kHit1		 = keyboard_check_pressed(ord("D"));
	global.DPressed = kHit1
	
	kHitSp		 = keyboard_check_pressed(ord("A"));
	global.APressed = kHitSp
	
	kJump        = keyboard_check_pressed(ord("S"));
	global.SPressed = kJump
	
	kLeftOnce	 = keyboard_check_pressed(vk_left);
	//global.leftPressed = kLeftOnce
	
	kRightOnce	 = keyboard_check_pressed(vk_right);
	//global.rightPressed = kRightOnce
	
	for(dvc=0; dvc<7; dvc+=1){
	var mx = device_mouse_x(dvc)
	var my = device_mouse_y(dvc)

	var md = device_mouse_check_button(dvc, mb_left)
	var mp = device_mouse_check_button_pressed(dvc, mb_left)
	
	if(md == 1 and place_meeting(mx,my+32,oLeft)){
		kLeft = 1;
		global.leftPressed = kLeft
	} 
	
	else if(md == 1 and place_meeting(mx,my+32,oRight)){
		kRight = 1;
		global.rightPressed = kRight
	}
	
	else if(md == 1 and place_meeting(mx,my,oDown)){
		kDown = 1;
		global.downPressed = kDown
	}
	else if(md == 1 and place_meeting(mx,my,oUp)){
		kUp = 1;
		global.upPressed = kUp
	}
	else if(mp == 1 and place_meeting(mx,my,oA)){
		kHitSp = 1;
		global.APressed = kHitSp
	}
	
	else if(mp == 1 and place_meeting(mx,my,oD)){
		kHit1 = 1;
		global.DPressed = kHit1
	}
	
	else if(mp == 1 and place_meeting(mx,my,oS)){
		kJump = 1;
		global.SPressed = kJump
	}
}
	
}