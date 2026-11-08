if (global.jogo_pausado == true) exit;
oldhp = hp;

switch (estado) {
    case "perseguir":

        if (instance_exists(obj_plr_rpg)) {
            alvo_x = obj_plr_rpg.x;
            alvo_y = obj_plr_rpg.y;
        }

        if (tempo_recalcular > 0) {
            tempo_recalcular--;
        }

        if (tempo_recalcular <= 0 && instance_exists(obj_plr_rpg)) {
            tempo_recalcular = 20;
            mp_grid_clear_all(grid_ia);

            var _colunas = ceil(room_width / grid_tamanho);
            var _linhas = ceil(room_height / grid_tamanho);

            for (var yy = 0; yy < _linhas; yy++) {
                for (var xx = 0; xx < _colunas; xx++) {
                    var _px = xx * grid_tamanho + grid_tamanho * 0.5;
                    var _py = yy * grid_tamanho + grid_tamanho * 0.5;

                    var _tile = tilemap_get_at_pixel(tilemap_foreground, _px, _py);

                    if (tile_get_index(_tile) != 0) {
                        mp_grid_add_cell(grid_ia, xx, yy);
                    }
                }
            }

            path_clear_points(caminho);

            var _achou_caminho = mp_grid_path(
                grid_ia,
                caminho,
                x,
                y,
                alvo_x,
                alvo_y,
                false
            );

            if (_achou_caminho) {
                ponto_atual = 1;
            } else {
                ponto_atual = 0;
            }
        }

        if (path_get_number(caminho) > ponto_atual) {
            var _dest_x = path_get_x(caminho, ponto_atual);
            var _dest_y = path_get_y(caminho, ponto_atual);

            var _dist = point_distance(x, y, _dest_x, _dest_y);

            if (_dist <= move_spd + 1) {
                ponto_atual++;
            } else {
                var _dir = point_direction(x, y, _dest_x, _dest_y);
                var _hor = lengthdir_x(move_spd, _dir);
                var _ver = lengthdir_y(move_spd, _dir);

                move_and_collide(_hor, _ver, [tilemap_foreground]);

                facing = _dir;

                if (abs(_hor) > abs(_ver)) {
                    if (hp > 25) {
                        sprite_walkh(_hor, _ver, spr_Arc_8BodyFwBw, spr_Arc_8BodyRight, spr_Arc_8BodyLeft);
                    } else {
                        sprite_walkh(_hor, _ver, spr_Arc_8BrokenFwBw, spr_Arc_8BrokenRight, spr_Arc_8BrokenLeft);
                    }
                } else {
                    if (hp > 25) {
                        sprite_walkv(_hor, _ver, spr_Arc_8BodyFwBw, spr_Arc_8BodyRight, spr_Arc_8BodyLeft);
                    } else {
                        sprite_walkv(_hor, _ver, spr_Arc_8BrokenFwBw, spr_Arc_8BrokenRight, spr_Arc_8BrokenLeft);
                    }
                }

                image_speed = 1;
            }
        } else {
            image_speed = 0;
        }

        if (empurra > 0) {
            var _empurra_x = lengthdir_x(empurra, empurra_dir);
            var _empurra_y = lengthdir_y(empurra, empurra_dir);

            move_and_collide(_empurra_x, _empurra_y, [tilemap_foreground]);

            empurra *= 0.8;

            if (empurra < 0.1) {
                empurra = 0;
            }
        }

        tempo_estado--;

        if (tempo_estado <= 0) {
            estado = "atirar";
            tempo_estado = 100;
            tempo_tiro = 1;
            image_speed = 0;
        }

    break;

    case "atirar":

        tempo_estado--;
        image_speed = 0;
        tempo_tiro--;

        if (tempo_tiro <= 0) {
            if (instance_exists(obj_plr_rpg)) {
                var _tiro = instance_create_layer(x, y, "Entidades", obj_tiro_boss);
                _tiro.direction = point_direction(x, y, obj_plr_rpg.x, obj_plr_rpg.y);
            }

            tempo_tiro = 20;
        }

        if (tempo_estado <= 0) {
            estado = "perseguir";
            tempo_estado = 600;
            tempo_recalcular = 0;
        }

    break;
}

if (dano_time > 0) {
    dano_time--;

    if (dano_time mod 4 == 0) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }
} else {
    image_blend = c_white;
}

if (hp <= 0) {
    audio_play_sound(snd_death_arc8, 1, false);
    instance_destroy();
}