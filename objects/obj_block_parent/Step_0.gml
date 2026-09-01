// EVENTO: Step

var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _bloco_gui_x = x - _cam_x;
var _bloco_gui_y = y - _cam_y;

var _half_w = sprite_width / 2;
var _half_h = sprite_height / 2;

var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

if (mouse_check_button_pressed(mb_left)) {
    var _clicou = false;
    
    if (_livro_aberto) {
        // Verifica colisão na tela GUI
        if (point_in_rectangle(_mouse_gui_x, _mouse_gui_y, _bloco_gui_x - _half_w, _bloco_gui_y - _half_h, _bloco_gui_x + _half_w, _bloco_gui_y + _half_h)) {
            _clicou = true;
            offset_x = _bloco_gui_x - _mouse_gui_x;
            offset_y = _bloco_gui_y - _mouse_gui_y;
        }
    } else {
        // Verifica colisão no Mundo
        if (position_meeting(mouse_x, mouse_y, id)) {
            _clicou = true;
            offset_x = x - mouse_x;
            offset_y = y - mouse_y;
        }
    }
    
    if (_clicou) {
        arrastando = true;
    }
}