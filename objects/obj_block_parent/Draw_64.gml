// Se o livro estiver aberto, desenha o bloco no evento GUI
if (instance_exists(obj_spellbook) && obj_spellbook.abrir) {
    var _gui_x = x - camera_get_view_x(view_camera[0]);
    var _gui_y = y - camera_get_view_y(view_camera[0]);

    draw_sprite_ext(sprite_index, image_index, _gui_x, _gui_y, 2.8, 2.8, image_angle, image_blend, image_alpha);
    
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    
    var _cam_x =  camera_get_view_x(view_camera[0]);
    var _cam_y =    camera_get_view_y(view_camera[0]);
    
     var _slot = instance_place(x, y, obj_colission_bl);
    
    if(_slot = noone){
    x = (_centro_x + 180) + _cam_x;
    y = _centro_y + _cam_y;
    }
}


