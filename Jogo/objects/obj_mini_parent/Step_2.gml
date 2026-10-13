var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

if (_livro_aberto) {
    // --- DEFINIÇÕES DE PÁGINA E LIMITES DA GUI ---
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
        y = _centro_y + _cam_y;
        primeira = true;
    }

    // --- LÓGICA DE ARRASTE ---
    if (arrastando) {
        aumenta = true;
        
        var _mouse_gui_x = device_mouse_x_to_gui(0);
        var _mouse_gui_y = device_mouse_y_to_gui(0);

        // Aplica a trava de limites no mouse
        var _gui_limitada_x = clamp(_mouse_gui_x + offset_x, _min_gui_x, _max_gui_x);
        var _gui_limitada_y = clamp(_mouse_gui_y + offset_y, _min_gui_y, _max_gui_y);

        // Atualiza a posição física (x, y) no mundo
        x = _gui_limitada_x + _cam_x;
        y = _gui_limitada_y + _cam_y;

        // --- MOUSE SOLTO: CHECA ENCAIXE ---
        if (mouse_check_button_released(mb_left)) {
            arrastando = false;

            // Busca colisão prioritariamente com sub-slot pequeno, depois slot base
            var _slot_pequeno = instance_place(x, y, obj_colission_bl_pequeno);
            var _slot_base = instance_place(x, y, obj_colission_bl);

            if (_slot_pequeno != noone) {
                // Encaixa no slot do bloco maior
                x = _slot_pequeno.x;
                y = _slot_pequeno.y;
                show_debug_message("Bloquinho menor encaixado no sub-slot!");
            } else if (_slot_base != noone) {
                // Alternativa: Encaixa no slot normal
                x = _slot_base.x;
                y = _slot_base.y;
                show_debug_message("Bloquinho menor encaixado na linha: " + string(_slot_base.linha));
            } else {
                // Volta ao início
                x = (_centro_x + 180) + _cam_x;
                y = _centro_y + _cam_y;
                show_debug_message("Não encaixou, voltou ao início!");
            }
        }
    } else {
        aumenta = false;
    }
} else {
    primeira = false;
}