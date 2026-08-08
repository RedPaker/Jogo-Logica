
//uhh ignore o messi code plzz
var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W")); 


//sprint
if (keyboard_check(vk_shift)){ 
    move_spd = 1.5
    /*move_spdy = 1.5;
    move_spdx = 1.5;*/
} else {
    move_spd = 1
    /*move_spdy = 1;
    move_spdx = 1;*/
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

if(noclip==0){
    move_and_collide(_target_x, _target_y, tilemap_foreground, undefined, undefined, undefined, move_spd, move_spd);
}else{
    move_and_collide(_target_x, _target_y, undefined, undefined, undefined, undefined, move_spd, move_spd);
}


if(keyboard_check(ord("n")) and noclip == 0){
    noclip = 1
}else{
    noclip = 0
}




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
//67
