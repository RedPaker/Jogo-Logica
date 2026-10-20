global.book = [];
abrir = false;
bloco_ja_criado = false;
depth = 100;
slots_criados = false
pagina_atual = 0


//Aqui vai ser o spawn dos blocos  nas páginas (eu acho)

if (!variable_global_exists("paginas_spawn_data")) {
    global.paginas_spawn_data = [];
}

global.paginas_spawn_data[0] = [
    {
        objeto: obj_bloco_print,
        offset_x: 180,
        offset_y: -100,
        linha_inicial: noone // noone = vai pro inventário | numero (0-8) = encaixa direto no slot
    },
    {
        objeto: obj_bloco_disco,
        offset_x: 220,
        offset_y: -100,
        linha_inicial: noone
    }
    ];

global.paginas_spawn_data[1] = [
    {
        objeto: obj_bloco_disco,
        offset_x: 180,
        offset_y: -50,
        linha_inicial: noone
    }
];

//BLOCOS:

spawn_blocos_pagina = function(pagina_atual) {
    with (obj_block_parent) instance_destroy()
    with (obj_mini_parent) instance_destroy()
        
    if (pagina_atual >= array_length(global.paginas_spawn_data)) return;
        
    var _lista_blocos = global.paginas_spawn_data[pagina_atual];
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    for (var i = 0; i < array_length(_lista_blocos); i++){
        
        var _dados = _lista_blocos[i];
        var _spawn_x = (_centro_x + _dados.offset_x) + _cam_x;
        var _spawn_y = (_centro_y + _dados.offset_y) + _cam_y;
        var _novo_bloco = instance_create_layer(_spawn_x, _spawn_y, "Instances", _dados.objeto);
        
        _novo_bloco.offset_inventario_x = _dados.offset_x;
        _novo_bloco.offset_inventario_y = _dados.offset_y;
        _novo_bloco.primeira = true;
        
        
    }
    
}




//COLISÃO:
spawn_blocos_colisao = function() {
    
    // Quando abre o livro:
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    
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
    
    
}
    slots_criados = true
}
