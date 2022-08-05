/// @description Insert description here
// You can write your code in this editor

var rkey= keyboard_check(vk_right);
var lkey= keyboard_check(vk_left);
var jkey= keyboard_check_pressed(ord("C"));
var walljump= keyboard_check(ord("C"));
// check for ground

if(place_meeting(x,y+1,obj_block)){
	vspd=0;
	
	if(jkey){
		vspd= -jspd;
	}
}else{
	//gravity
	if(vspd<11){
		vspd+=grav;
	}
}

// moving right

if(rkey){
	hspd=spd;
	// left wall jump
	if(place_meeting(x-1,y,obj_block)&& !place_meeting(x,y+1,obj_block) &&!lkey&&walljump){
		
		vspd= -jspd;
	}
}
// moving left
if(lkey){
	hspd=-spd;
	// right wall jump
	if(place_meeting(x+1,y,obj_block)&& !place_meeting(x,y+1,obj_block)&&!rkey&&walljump){
		
		vspd= -jspd;
		
	}
}

//check for not moving
if(rkey&&lkey || !rkey&&!lkey){
	hspd=0;
}

#region//Colision Horizontal.
/// Horizontal collision
if place_meeting(x+hspd,y,obj_block)
{
	while (!place_meeting(x+sign(hspd),y,obj_block))
	{
		x = x + sign(hspd);
	}
	
	hspd=0;
}
x = x + hspd;
#endregion

#region//Colision Vertical.
/// Vertical collision
if place_meeting(x,y+vspd,obj_block)
{
	while (!place_meeting(x,y+sign(vspd),obj_block))
	{
		y = y + sign(vspd);
	}
	
	vspd=0;
}
y = y + vspd;
#endregion