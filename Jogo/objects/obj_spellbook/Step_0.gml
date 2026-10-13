if (keyboard_check_pressed(ord("B"))){
    abrir = !abrir;
}

// Quando abre o livro:
var _centro_x = display_get_gui_width() / 2;
var _centro_y = display_get_gui_height() / 2;

var _slots_total = 9;
var _espacamento_y = 50;

for (var i = 0; i < _slots_total; i++) {
    var _slot = instance_create_layer(_centro_x - 180, _centro_y - 120 + (i * _espacamento_y), "Instances", obj_colission_bl);
    
    _slot.linha = i;
    _slot.offset_livro_x = -180;
    _slot.offset_livro_y = - 200 + (i * _espacamento_y);
}


//TESTES
// Supondo que a origem da sprite do bloco maior seja no Canto Superior Esquerdo (0,0):
meus_sub_slots = [];

var _total_sub_slots = 5;
var _largura_sub_slot = 16;

for (var i = 0; i < _total_sub_slots; i++) {
    var _slot_pequeno = instance_create_layer(x, y, "Instances", obj_collision_mini);
    
    _slot_pequeno.bloco_mae = id;
    _slot_pequeno.sub_linha = i;
    
    // Alinha horizontalmente: slot 0 em X=0, slot 1 em X=16, slot 2 em X=32, etc.
    _slot_pequeno.offset_pai_x = i * _largura_sub_slot; 
    _slot_pequeno.offset_pai_y = 0;
    

    array_push(meus_sub_slots, _slot_pequeno);
}