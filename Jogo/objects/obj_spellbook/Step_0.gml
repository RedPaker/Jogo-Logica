if (keyboard_check_pressed(ord("B"))) {
    abrir = !abrir;
}

if (abrir){
    // 1. Configurações da lista de slots
var _quantidade_slots = 9;  // Quantas linhas de código você quer
var _espacamento_y = 50;    // Distância vertical entre cada slot (ajuste a gosto)

    
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    // Atualiza o X e Y reais no mundo do slot para alinhar com o livro
    x = (_centro_x + offset_livro_x) + _cam_x;
    y = (_centro_y + offset_livro_y) + _cam_y;
    
// 2. Posição inicial do primeiro slot (no mundo)
var _inicio_x = x 
var _inicio_y = y 

// 3. Loop para clonar/instanciar o obj_colission_bl
for (var i = 0; i < _quantidade_slots; i++) {
    var _pos_y = _inicio_y + (i * _espacamento_y);
    
    // Cria uma nova instância do slot
    var _novo_slot = instance_create_layer(_inicio_x, _pos_y, "Instances", obj_colission_bl);
    
    // Configura as variáveis de cada cópia criada
    _novo_slot.linha = i;
    _novo_slot.ocupado = false;
    _novo_slot.bloco_encaixado = noone;
}
}