var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

if (_livro_aberto) {
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _escala_livro = 6;
    var _centro_livro_x = (sprite_get_width(spr_livro_feiticos_principal) * _escala_livro) / 2;
    var _centro_livro_y = (sprite_get_height(spr_livro_feiticos_principal) * _escala_livro) / 2;

    var _min_gui_x = (_centro_x - _centro_livro_x) + 200;
    var _max_gui_x = (_centro_x + _centro_livro_x) - 200;
    var _min_gui_y = (_centro_y - _centro_livro_y) + 80;
    var _max_gui_y = (_centro_y + _centro_livro_y) - 80;

    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    if (!primeira) {
        x = (_centro_x + 180) + _cam_x;
        y = (_centro_y + 100) + _cam_y;
        primeira = true;
    }

    if (arrastando) {
        aumenta = true;
        
        var _mouse_gui_x = device_mouse_x_to_gui(0);
        var _mouse_gui_y = device_mouse_y_to_gui(0);

        var _gui_limitada_x = clamp(_mouse_gui_x + offset_x, _min_gui_x, _max_gui_x);
        var _gui_limitada_y = clamp(_mouse_gui_y + offset_y, _min_gui_y, _max_gui_y);

        x = _gui_limitada_x + _cam_x;
        y = _gui_limitada_y + _cam_y;

        if (mouse_check_button_released(mb_left)) {
            arrastando = false;
            a_frente = false;

            var _slot_mini = instance_place(x, y, obj_colission_mini);

            if (_slot_mini != noone) {
                var _linha_alvo = _slot_mini.linha;
                var _tem_bloco = false;

                with (obj_block_parent) {
                    var _slot_pai = instance_place(x, y, obj_colission_bl);
                    
                    if (_slot_pai != noone && _slot_pai.linha == _linha_alvo) {
                        _tem_bloco_ = true;
                    }
                }

                var _posicao_valida = (hitbox_valido == -1 || _slot_mini.posicao == hitbox_valido);

                if (_tem_bloco && _posicao_valida) {
                    x = _slot_mini.x;
                    y = _slot_mini.y;
                } else {
                    x = (_centro_x + 180) + _cam_x;
                    y = (_centro_y + 100) + _cam_y;
                }
                
            } else {
                x = (_centro_x + 180) + _cam_x;
                y = (_centro_y + 100) + _cam_y;
            }
        }
    } else {
        aumenta = false;
    }
} else {
    primeira = false;
}