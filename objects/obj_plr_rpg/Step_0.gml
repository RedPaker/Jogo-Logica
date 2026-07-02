//uhh ignore o messi code plzz
var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W")); 

//sprint
if (keyboard_check(vk_shift)){ 
    move_spdy = 1.5;
    move_spdx = 1.5;
} else {
    move_spdy = 1;
    move_spdx = 1;
}

//Isso são velocidades alvo pro lerp. Quando vc anda, o target vira 2, e o lerp aumenta a velocidade 5% a cada frame, até chegar no 2. Elas começam em zero, ou seja, qdo vc soltar a tecla o target vira 0, e como o lerp busca chegar no target ele vai desacelerar 5% por frame.
var _target_x = 0; 
var _target_y = 0;

if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y); //pega a direção  
    _target_x = lengthdir_x(move_spdx, _dir); //essa função calcula o quanto o player tem que andar pra percorrer x velocidade em x ângulo (Faz a velocidade diagonal tb ser um target)
    _target_y = lengthdir_y(move_spdy, _dir);
}

//larp larp larp sahur (linear interpoland)
hspd = lerp(hspd, _target_x, 0.1);
vspd = lerp(vspd, _target_y, 0.1);


move_and_collide(hspd, vspd, tilemap_foreground);//ai ai ai