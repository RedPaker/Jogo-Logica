

// EVENTO: End Step

var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

if (arrastando) {
    if (_livro_aberto) {
        // Quando o livro está aberto, arrastamos em relação à GUI (tela)
        var _mouse_gui_x = device_mouse_x_to_gui(0);
        var _mouse_gui_y = device_mouse_y_to_gui(0);
        
        // Atualiza a posição real no mundo para corresponder exatamente ao ponto da tela da câmera
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);
        
        x = (_mouse_gui_x + offset_x) + _cam_x;
        y = (_mouse_gui_y + offset_y) + _cam_y;
    } else {
        // Arraste normal pelo mundo
        x = mouse_x + offset_x;
        y = mouse_y + offset_y;
    }
    
    // Soltar o mouse
    if (mouse_check_button_released(mb_left)) {
        arrastando = false;
    }
}