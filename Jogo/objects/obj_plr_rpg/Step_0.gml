
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

if (keyboard_check_pressed(ord("P"))) {
    game_restart();
    exit;
}

if (keyboard_check_pressed(ord("H"))){
    cutscene_play([
    { sprite: cutscene1, frame: 8, fade: "in", music: snd_musicaboa, wait: 3, auto: true },
    { sprite: cutscene1, frame: 8, dialog: [
          { name: "???", msg: "Essa e bitlandia, um lugar sereno e tranquilo" }
      ] },
    { sprite: cutscene1, frame: 8, wait: 3, auto: true },
    
        { sprite: cutscene1, frame: 0, dialog: [
          { name: "???", msg: "Esse e 0x43, um velho computador dormindo sob a arvore" }
      ] },


    { sprite: cutscene1, frame: 1, shake: 30, flash: true, snd: snd_explosion, wait: 2, auto: true, music: noone},
    
        { sprite: cutscene1, frame: 1, music: snd_musicaassustadora,
      dialog: [
          { name: "0x43", msg: "O que foi isso?!" }
      ] },
    
        { sprite: cutscene1, frame: 2,},
        { sprite: cutscene1, frame: 3, },
        { sprite: cutscene1, frame: 4, wait: 1, auto: true },
        { sprite: cutscene1, frame: 5,wait: 1, auto: true },
        { sprite: cutscene1, frame: 6, wait: 1, auto: true },
        { sprite: cutscene1, frame: 7, wait: 1, auto: true },

    { fade: "out", auto: true}
], function() {
    room_goto(rm_casa);
});
}

if (hp <= 0) {
    game_over = true;
} else {

    if (instance_number(obj_binario_puzzle) > 0) {
        var _puzzle = instance_find(obj_binario_puzzle, 0);
        if (_puzzle.interagindo) exit;
    }

    if (global.jogo_pausado == true) exit;

    if (instance_exists(obj_choque) && obj_choque.lifetime > 0) exit;

    if (impacto > 0) {
        impacto--;
        exit;
    }

    // Tratamento da cura
    if (curando) {
        _input_x = 0;
        _input_y = 0;

        if (!animacao_cura_iniciada) {
            sprite_index = spr_plr_curando;
            image_index = 0;
            image_speed = 1;
            animacao_cura_iniciada = true;
        }

        if (image_index >= sprite_get_number(spr_plr_curando) - 1) {
            image_index = sprite_get_number(spr_plr_curando) - 1;
            image_speed = 0;

            hp = min(hp + 30, hp_max);

            curando = false;
            tempo_cura = 0;
            animacao_cura_iniciada = false;

            // Prepara o retorno da animação normal
            image_index = 0;
        }
    } else {
        animacao_cura_iniciada = false;

        _input_x = keyboard_check(global.st_right) - keyboard_check(global.st_left);
        _input_y = keyboard_check(global.st_down) - keyboard_check(global.st_up);
    }

    // Sprint
    if (keyboard_check(global.st_run)) {
        if (state == 5) move_spd = 0.75;
        else move_spd = 1.5;
    } else {
        if (state == 6) move_spd = 1.5;
        else move_spd = 1;
    }

    // Noclip
    if (keyboard_check_pressed(ord("N"))) {
        if (state == 2) state = 0;
        else state = 2;
    }

    // Movimentação
    var _target_x = 0;
    var _target_y = 0;

    if (!curando && (_input_x != 0 || _input_y != 0)) {
        var _dir = point_direction(0, 0, _input_x, _input_y);
        _target_x = lengthdir_x(move_spd, _dir);
        _target_y = lengthdir_y(move_spd, _dir);
    }

    var _old_x = x;
    var _old_y = y;

    if (!curando) {
        if (state == 0 || state == 5 || state == 6) {
            move_and_collide(_target_x, _target_y, [tilemap_foreground, inviswalls,inviswallss]);
        } else if (state == 2) {
            x += clamp(_target_x * 5, -5, 5);
            y += clamp(_target_y * 5, -5, 5);
        }
    }

    cam_x = x - _old_x;
    cam_y = y - _old_y;

    // Controle de sprites
    if (!curando) {

        if (_input_x != 0 || _input_y != 0) {
            image_speed = 1;

            facing = point_direction(0, 0, _input_x, _input_y);

            var _xface = lengthdir_x(1, facing);
            var _yface = lengthdir_y(1, facing);

            if (state != 5) {
                if (_xface > 0) sprite_index = spr_plr_walk_right;
                else if (_xface < 0) sprite_index = spr_plr_walk_left;
                else if (_yface > 0) sprite_index = spr_plr_walk_down;
                else if (_yface < 0) sprite_index = spr_plr_walk_up;
            } else {
                if (_xface < 0) sprite_index = spr_plr_walk_right;
                else if (_xface > 0) sprite_index = spr_plr_walk_left;
                else if (_yface < 0) sprite_index = spr_plr_walk_down;
                else if (_yface > 0) sprite_index = spr_plr_walk_up;
            }

        } else {
            switch (facing) {
                case 0:
                    sprite_index = spr_plr_td_right;
                    image_speed = 0;
                    image_index = 0;
                break;

                case 180:
                    sprite_index = spr_plr_td_left;
                    image_speed = 0;
                    image_index = 0;
                break;

                case 90:
                    sprite_index = spr_plr_td_up;
                    image_speed = 0;
                    image_index = 0;
                break;

                case 270:
                    sprite_index = spr_plr_td_down;
                    image_speed = 1;
                break;

                default:
                    sprite_index = spr_plr_td_down;
                    image_speed = 1;
                break;
            }
        }

        // Sprint
        if (state == 5 && (_input_x != 0 || _input_y != 0)) {
            var _xface = lengthdir_x(1, facing);
            var _yface = lengthdir_y(1, facing);

            if (_xface < 0) sprite_index = spr_plr_walk_right;
            else if (_xface > 0) sprite_index = spr_plr_walk_left;
            else if (_yface < 0) sprite_index = spr_plr_walk_down;
            else if (_yface > 0) sprite_index = spr_plr_walk_up;
        }

        // Efeito da magia Flash
        if (instance_exists(obj_flash)) {
            if (sprite_index == spr_plr_td_down) {
                sprite_index = spr_plr_td_down_light;
            }
        } else {
            if (sprite_index == spr_plr_td_down_light) {
                sprite_index = spr_plr_td_down;
            }
        }
    }

    // Ataque
    if (ataque_time > 0) ataque_time--;

    if (!curando && keyboard_check_pressed(global.st_use) && ataque_time <= 0 && !instance_exists(obj_dialogo)) {
        var _distancia = 14;

        var _dx = lengthdir_x(_distancia, facing);
        var _dy = lengthdir_y(_distancia, facing);

        if (abs(_dx) < abs(_dy)) {
            _ax = 0;
            _ay = x + _dy;
        } else {
            _ax = y + _dx;
            _ay = 0;
        }

        instance_create_layer(_ax, _ay, "Entities", obj_atack, {
            atk_dist: _distancia
        });

        ataque_time = 40;
    }

    // Dash
    if (!curando && keyboard_check_pressed(ord("X"))) {
        dash_dir = facing;

        var _dash_x = lengthdir_x(dash_vel, dash_dir);
        var _dash_y = lengthdir_y(dash_vel, dash_dir);

        var _passos = ceil(dash_vel);

        for (var i = 0; i < _passos; i++) {
            var _dx = _dash_x / _passos;
            var _dy = _dash_y / _passos;

            if (place_meeting(x + _dx, y + _dy, inviswalls)) break;

            x += _dx;
            y += _dy;
        }
    }

    // Empurrão
    if (empurra > 0 && state == 0 && !curando) {
        var _empurra_x = lengthdir_x(empurra, empurra_dir);
        var _empurra_y = lengthdir_y(empurra, empurra_dir);

        move_and_collide(_empurra_x, _empurra_y, [tilemap_foreground, inviswalls,inviswallss]);

        empurra *= 0.8;

        if (empurra < 0.2) empurra = 0;
    }

    // Efeito de dano
    if (dano_time > 0) {
        dano_time--;

        if ((dano_time div 4) % 2 == 0) image_blend = c_red;
        else image_blend = c_white;
    } else {
        image_blend = c_white;
    }
}
