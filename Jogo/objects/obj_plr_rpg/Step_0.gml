if (instance_exists(obj_dialogo)){
    exit
}
if (keyboard_check_pressed(ord("P"))) {
       game_restart();
        exit;
}

if (instance_exists(obj_choque) && obj_choque.lifetime > 0){
    exit
}

if(impacto > 0){
    impacto--;
    exit;
}

if (obj_spellbook.abrir){
    move_spd = 0
    exit
}

//uhh ignore o messi code plzz
var _input_x = keyboard_check(global.st_right) - keyboard_check(global.st_left);
var _input_y = keyboard_check(global.st_down) - keyboard_check(global.st_up);


//sprint
if (keyboard_check(global.st_run)){ 
    if (state == 5){
        move_spd = 0.75
        /*move_spdy = 1.5;
        move_spdx = 1.5;*/
    }else {
        move_spd = 1.5
        /*move_spdy = 1.5;
        move_spdx = 1.5;*/
    }
    
} else {
    if (state == 5){
        move_spd = .5
        /*move_spdy = 1;
        move_spdx = 1;*/
    }else {
        move_spd = 1
        /*move_spdy = 1;
        move_spdx = 1;*/
    }
    move_spd = 1
    /*move_spdy = 1;
    move_spdx = 1;*/
}

if(keyboard_check_pressed(ord("N"))){
    if (state == 2) {
    	state = 0;
    }else {
    	state = 2;
    }
}

if (!instance_exists(obj_dialogo)){
    instance_activate_layer("Entidades");
    instance_activate_layer("Itens");
    instance_activate_layer("Misc");
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

if(state==0 or state == 5){  
    move_and_collide(_target_x, _target_y, tilemap_foreground, undefined, undefined, undefined);
}else if(state == 2){
    x += clamp(_target_x*5, -5, 5);
    y += clamp(_target_y*5, -5, 5);
}


cam_x = x-_old_x; 
cam_y = y-_old_y;


if(_input_x != 0 or _input_y != 0){
    if (state == 5) {
    	if(_input_x < 0) sprite_index = spr_plr_td_right;
        else if(_input_x > 0) sprite_index = spr_plr_td_left;
        else if (_input_y < 0) sprite_index = spr_plr_td_down;
        else if (_input_y > 0) sprite_index = spr_plr_td_up;
    }else {
    	if(_input_x > 0) sprite_index = spr_plr_td_right;
        else if(_input_x < 0) sprite_index = spr_plr_td_left;
        else if (_input_y > 0) sprite_index = spr_plr_td_down;
        else if (_input_y < 0) sprite_index = spr_plr_td_up;
    }
    
    
        
    facing = point_direction(0, 0, _input_x, _input_y);
}
else{
    if(sprite_index == spr_plr_td_right) sprite_index = spr_plr_td_right;
    else if(sprite_index == spr_plr_td_left) sprite_index = spr_plr_td_left;
    else if(sprite_index == spr_plr_td_up) sprite_index = spr_plr_td_up;
    else if(sprite_index ==  spr_plr_td_down) sprite_index =  spr_plr_td_down;
}
if (keyboard_check_pressed(global.st_use) && ataque_time <= 0) {
    var _distancia = 14;

    var _dx = lengthdir_x(_distancia, facing);
    var _dy = lengthdir_y(_distancia, facing);
    
    if (abs(_dx)<abs(_dy)){
        _ax = 0;
        _ay = x + _dy;
    }else {
    	_ax = y + _dx;
        _ay = 0;
    }
    
    instance_create_layer(_ax, _ay, "instances", obj_atack, {atk_dist:_distancia});
    /*var _atk_dist = 10;
    facing = point_direction(x,y,mouse_x,mouse_y);
    var _atk_x = x + lengthdir_x(_atk_dist, facing);
    var _atk_y = y + lengthdir_y(_atk_dist, facing);
    
    instance_create_layer(_atk_x, _atk_y, "instances", obj_atack,{
        atk_x : _atk_x,
        atk_y : _atk_y,
        atk_dist : _atk_dist,
        atk_face : facing
    });*/
    
    ataque_time = 60;
}



if (ataque_time > 0) {
    ataque_time--;
}

if (hp <= 0) {
    hp = 0;
    game_over = true;
}

if (empurra > 0 && state==0) {
    var _empurra_x = lengthdir_x(empurra, empurra_dir);
    var _empurra_y = lengthdir_y(empurra, empurra_dir);

    move_and_collide(_empurra_x, _empurra_y, tilemap_foreground);

    empurra *= 0.8;

    if (empurra < 0.2) {
        empurra = 0;
    }
}

if (dano_time > 0) {
    dano_time--;

    if ((dano_time div 4) % 2 == 0) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }
}
else {
    image_blend = c_white;
}


// TESTE GIT
//67
//depth = -y