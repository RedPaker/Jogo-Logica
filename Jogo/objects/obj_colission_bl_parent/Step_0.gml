if (instance_exists(obj_spellbook) && obj_spellbook.abrir) {
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    // Atualiza o X e Y reais no mundo do slot para alinhar com o livro
    x = (_centro_x + offset_livro_x) + _cam_x;
    y = (_centro_y + offset_livro_y) + _cam_y;
    
}


 var _gui_x = x - camera_get_view_x(view_camera[0]);
var _gui_y = y - camera_get_view_y(view_camera[0]);


