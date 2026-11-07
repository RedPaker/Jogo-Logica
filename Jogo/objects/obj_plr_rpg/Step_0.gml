
if (hp < hp_anterior) {
    if (bat_pisca <= 0) hp_fantasma = hp_anterior;
    bat_pisca = 60;
}

if (hp > hp_anterior) {
    hp_fantasma = hp;
    bat_pisca = 0;
}

if (bat_pisca > 0) {
    bat_pisca--;
    if (bat_pisca <= 0) hp_fantasma = hp;
}

hp_anterior = hp;

if(hp <= 0){
    game_over = true;

    if (keyboard_check_pressed(ord("P"))) {
        game_restart();
        exit;
    }
}

else {

    if (instance_number(obj_binario_puzzle) > 0) {
        var _puzzle = instance_find(obj_binario_puzzle, 0);

        if (_puzzle.interagindo) {
            exit;
        }
    }

    if (instance_exists(obj_dialogo)){
        exit;
    }

    if (instance_exists(obj_choque) && obj_choque.lifetime > 0){
        exit;
    }

    if(impacto > 0){
        impacto--;
        exit;
    }

    if (obj_spellbook.abrir){
        move_spd = 0;
        exit;
    }
    if (curando) {
        _input_x = 0;
        _input_y = 0;
        if (image_index >= sprite_get_number(spr_plr_curando) - 1) {
            image_index = sprite_get_number(spr_plr_curando) - 1;
            image_speed = 0;
            hp = min(hp + 30, hp_max);
            curando = false;
            tempo_cura = 0;
            animacao_cura_iniciada = false;
        }
    } else {
        _input_x = keyboard_check(global.st_right) - keyboard_check(global.st_left);
        _input_y = keyboard_check(global.st_down) - keyboard_check(global.st_up);
    }

    //sprint
    if (keyboard_check(global.st_run)){ 
        if (state == 5){
            move_spd = 0.75;
        }else {
            move_spd = 1.5;
        }

    } else {
        if (state == 6){
            move_spd = 1.5;
        }else {
            move_spd = 1;
        }
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

    if (!curando && (_input_x != 0 || _input_y != 0)) {
        var _dir = point_direction(0, 0, _input_x, _input_y);
        _target_x = lengthdir_x(move_spd, _dir);
        _target_y = lengthdir_y(move_spd, _dir);
    }

    /*larp larp larp sahur (linear interpoland)
    hspd = lerp(hspd, _target_x, 0);
    vspd = lerp(vspd, _target_y, 0);*/

    var _old_x = x;
    var _old_y = y;

    if(state == 0 or state == 5 or state == 6){  
        move_and_collide(_target_x, _target_y, [tilemap_foreground, inviswalls]);
    }else if(state == 2 && !curando){
        x += clamp(_target_x*5, -5, 5);
        y += clamp(_target_y*5, -5, 5);
    }

    cam_x = x-_old_x; 
    cam_y = y-_old_y;

    if (!curando && (_input_x != 0 or _input_y != 0)){
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

    if (curando) {
        if (!animacao_cura_iniciada) {
            sprite_index = spr_plr_curando;
            image_index = 0;
            image_speed = 1;
            animacao_cura_iniciada = true;
        }
    } else {
        animacao_cura_iniciada = false;
    }

    if (ataque_time > 0) {
        ataque_time--;
    }

    if (!curando && keyboard_check_pressed(global.st_use) && ataque_time <= 0) {
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

        ataque_time = 40;
    }

    if (!curando && keyboard_check_pressed(ord("X"))){
        dash_dir = facing;

        var _dash_x = lengthdir_x(dash_vel, dash_dir);
        var _dash_y = lengthdir_y(dash_vel, dash_dir);

        var _passos = ceil(dash_vel);

        for(var i = 0; i < _passos; i++){
            var _dx = _dash_x / _passos;
            var _dy = _dash_y / _passos;

            if(place_meeting(x + _dx, y + _dy, inviswalls)){
                break;
            }

            x += _dx;
            y += _dy;
        }
    }

    if (empurra > 0 && state == 0 && !curando) {
        var _empurra_x = lengthdir_x(empurra, empurra_dir);
        var _empurra_y = lengthdir_y(empurra, empurra_dir);

        move_and_collide(_empurra_x, _empurra_y, [tilemap_foreground, inviswalls]);

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
}


// TESTE GIT
//67
//depth = -y
