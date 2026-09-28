if (keyboard_check_pressed(ord("B"))){
    abrir = !abrir;
}

// Quando abre o livro:
var _centro_x = display_get_gui_width() / 2;
var _centro_y = display_get_gui_height() / 2;

var _slots_total = 6;
var _espacamento_y = 50;

for (var i = 0; i < _slots_total; i++) {
    var _slot = instance_create_layer(_centro_x - 180, _centro_y - 120 + (i * _espacamento_y), "Instances", obj_colission_bl);
    
    _slot.linha = i;
    _slot.offset_livro_x = -180;
    _slot.offset_livro_y = -200 + (i * _espacamento_y);
}