
if (aumenta) { 
    scale_x = 3.2;
    scale_y = 3.2;
} else {
    scale_x = 2.8;
    scale_y = 2.8;
}

if (instance_exists(obj_spellbook) && obj_spellbook.abrir) {
    var _gui_x = x - camera_get_view_x(view_camera[0]);
    var _gui_y = y - camera_get_view_y(view_camera[0]);

    draw_sprite_ext(sprite_index, image_index, _gui_x, _gui_y, scale_x, scale_y, image_angle, image_blend, image_alpha);
}