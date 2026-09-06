

var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

var _centro_x = (display_get_gui_width() / 2);
var _centro_y = (display_get_gui_height() / 2);
var _escala_livro = 6;
var _centro_livro_x =  (sprite_get_width(spr_livro_feiticos_principal)*_escala_livro) / 2
var _centro_livro_y =  (sprite_get_height(spr_livro_feiticos_principal)*_escala_livro) / 2

var _min_gui_x = (_centro_x - _centro_livro_x) + 200;
var _max_gui_x = (_centro_x + _centro_livro_x) - 200;

var _min_gui_y = (_centro_y - _centro_livro_y) + 80;
var _max_gui_y = (_centro_y + _centro_livro_y) -80;


if (arrastando) {
    if (_livro_aberto) {
        
        // Quando o livro está aberto, arrastamos em relação à GUI (tela)
        var _mouse_gui_x = device_mouse_x_to_gui(0);
        var _mouse_gui_y = device_mouse_y_to_gui(0);
        
        
        var _gui_limitada_x = clamp(_mouse_gui_x + offset_x, _min_gui_x, _max_gui_x);
        var _gui_limitada_y = clamp(_mouse_gui_y + offset_y, _min_gui_y, _max_gui_y);
        
        // Atualiza a posição real no mundo para corresponder exatamente ao ponto da tela da câmera
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);
        
       
        x = _gui_limitada_x+ _cam_x;
        y = (_gui_limitada_y + _cam_y);
  
        
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