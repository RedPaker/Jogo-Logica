var _livro_aberto = instance_exists(obj_spellbook) && obj_spellbook.abrir;

if (_livro_aberto && mouse_check_button_pressed(mb_left)) {
  var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _bloco_gui_x = x - _cam_x;
var _bloco_gui_y = y - _cam_y;

var _gui_x = x - _cam_x;
var _gui_y = y - _cam_y;

if (point_in_rectangle(_mouse_gui_x, _mouse_gui_y, _gui_x - 32, _gui_y - 32, _gui_x + 32, _gui_y + 32)) {
    
    var _clone = instance_create_layer(x, y, "Instances", obj_bloco_print_imitador);
            
    with (_clone) {
            arrastando = true;
            offset_x = _gui_x - _mouse_gui_x;
            offset_y = _gui_y - _mouse_gui_y;
        }
}  
}

