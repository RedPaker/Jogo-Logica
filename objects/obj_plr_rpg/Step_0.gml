
//uhh ignore o messi code plzz
var _input_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _input_y = keyboard_check(vk_down) - keyboard_check(vk_up); 


//sprint
if (keyboard_check(ord("X"))){ 
    move_spd = 1.5
    /*move_spdy = 1.5;
    move_spdx = 1.5;*/
} else {
    move_spd = 1
    /*move_spdy = 1;
    move_spdx = 1;*/
}

if(keyboard_check_pressed(ord("N"))){
    if (noclip == 1) {
    	noclip = 0;
        show_debug_message("Noclip OFF!");
    }else {
    	noclip = 1;
    show_debug_message("Noclip ON");
    }
}


//Isso são velocidades alvo pro lerp. Quando vc anda, o target vira 2, e o lerp aumenta a velocidade 5% a cada frame, até chegar no 2. Elas começam em zero, ou seja, qdo vc soltar a tecla o target vira 0, e como o lerp busca chegar no target ele vai desacelerar 5% por frame.
var _target_x = 0; 
var _target_y = 0;

if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y); //pega a direção  
    _target_x = lengthdir_x(move_spd, _dir); //essa função calcula o quanto o player tem que andar pra percorrer x velocidade em x ângulo (Faz a velocidade diagonal tb ser um target)
    _target_y = lengthdir_y(move_spd, _dir);
}


/*larp larp larp sahur (linear interpoland)
hspd = lerp(hspd, _target_x, 0);
vspd = lerp(vspd, _target_y, 0);*/
var _old_x = x;
var _old_y = y;

if(noclip==0){  
    move_and_collide(_target_x, _target_y, tilemap_foreground, undefined, undefined, undefined);
}else{
    x += clamp(_target_x*5, -5, 5);
    y += clamp(_target_y*5, -5, 5);
}


cam_x = x-_old_x; 
cam_y = y-_old_y;


if(_input_x != 0 or _input_y != 0){
    if(_input_x > 0) sprite_index = spr_plr_td_right;
    else if(_input_x < 0) sprite_index = spr_plr_td_left;
    else if (_input_y > 0) sprite_index = spr_plr_td_down;
    else if (_input_y < 0) sprite_index = spr_plr_td_up;
        
    facing = point_direction(0, 0, _input_x, _input_y);
}
else{
    if(sprite_index == spr_plr_td_right) sprite_index = spr_plr_td_right;
    else if(sprite_index == spr_plr_td_left) sprite_index = spr_plr_td_left;
    else if(sprite_index == spr_plr_td_up) sprite_index = spr_plr_td_up;
    else if(sprite_index ==  spr_plr_td_down) sprite_index =  spr_plr_td_down;
}

if(keyboard_check_pressed(vk_space)){
    
    var _dist = 16;

    var xx = x + lengthdir_x(_dist, facing);
    var yy = y + lengthdir_y(_dist, facing);

    var _inst = instance_create_depth(xx, yy, depth, object_ataque);
    _inst.image_angle = facing;
    _inst.damage = damage;
}
//67
