if (keyboard_check_pressed(ord("B"))){
    abrir = !abrir;
}

// Quando abre o livro:
var _centro_x = display_get_gui_width() / 2;
var _centro_y = display_get_gui_height() / 2;

if (abrir && !slots_criados){
    var _slots_total = 9;
    var _espacamento_y = 50;
    var _espacamento_x = 45;

for (var i = 0; i < _slots_total; i++) {
    var _slot = instance_create_layer(_centro_x - 180, _centro_y - 120 + (i * _espacamento_y), "Instances", obj_colission_bl);
    
    _slot.linha = i;
    _slot.offset_livro_x = -180;
    _slot.offset_livro_y = - 200 + (i * _espacamento_y);
}

var _linhas_totais = 9
var _slots_mini = 5

for (var i = 0; i < _linhas_totais; i++) {
    for (var j = 0; j < _slots_mini; j++){
        var _slot = instance_create_layer(_centro_x - 180 + (j* _espacamento_x), _centro_y - 120 + (i * _espacamento_y), "Instances", obj_colission_mini);
    
        _slot.linha = i;
        _slot.offset_livro_x = -270 + (j* _espacamento_x) ;
        _slot.offset_livro_y = - 200 + (i * _espacamento_y);
    }
    
    slots_criados = true
}

}




