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
    
        if (primeira = false){
        x = (_centro_x + 180) + _cam_x;
        y = _centro_y + _cam_y; 
    }
    
    
    // --- LÓGICA DE ARRASTE ---
    if (arrastando) {
        primeira = true
        
        var _mouse_gui_x = device_mouse_x_to_gui(0);
        var _mouse_gui_y = device_mouse_y_to_gui(0);

        // Aplica a trava de limites no mouse
        var _gui_limitada_x = clamp(_mouse_gui_x + offset_x, _min_gui_x, _max_gui_x);
        var _gui_limitada_y = clamp(_mouse_gui_y + offset_y, _min_gui_y, _max_gui_y);

        // Atualiza a posição física (x, y) no mundo
        x = _gui_limitada_x + _cam_x;
        y = _gui_limitada_y + _cam_y;

        // --- MOUSE SOLTO: CHECA COLISÃO E ENCAIXE ---
        if (mouse_check_button_released(mb_left)) {
          arrastando = false;

    // Procura por QUALQUER slot que esteja embaixo do bloco
    var _slot = instance_place(x, y, obj_colission_bl);

    // Se achou um slot E o slot NÃO está ocupado por outro bloco
    if (_slot != noone && (!_slot.ocupado || _slot.bloco_encaixado == id)) {
        
        // Se este bloco já estava em outro slot antes, libera o slot antigo
        if (slot_atual != noone && slot_atual != _slot) {
            slot_atual.ocupado = false;
            slot_atual.bloco_encaixado = noone;
        }

        // ENCAIXA: Gruda no slot e marca como ocupado
        x = _slot.x;
        y = _slot.y;
        _slot.ocupado = true;
        _slot.bloco_encaixado = id;
        slot_atual = _slot; // Guarda a referência do slot neste bloco

        show_debug_message("Bloco Encaixado!");
    } else {
        // NÃO ENCAIXOU OU SLOT OCUPADO:
        // Se o bloco já tinha um slot antigo válido, volta para ele
        if (slot_atual != noone) {
            x = slot_atual.x;
            y = slot_atual.y;
        } else {
            // Se foi recém-criado da paleta e errou o slot, destrói (estilo Scratch)
            instance_destroy();
        }
        }
    }
    } 
        
} else {
    primeira = false
}