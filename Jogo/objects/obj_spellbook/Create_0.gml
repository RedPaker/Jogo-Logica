global.book = [];
abrir = false;
bloco_ja_criado = false;
depth = 100;
slots_criados = false
pagina_atual = 0
desenhar = false;


//Aqui vai ser o spawn dos blocos  nas páginas (eu acho)

if (!variable_global_exists("paginas_spawn_data")) {
    global.paginas_spawn_data = [];
}

global.paginas_spawn_data[0] = [
    {
        seq_certa: [1],
        seq_certa_mini:  [2]
    },
    {
        frase: "Arremesso de disco"
    },
    
    {
        objeto: obj_bloco_disco,
        offset_x: 100,
        offset_y: 1, 
        linha_inicial: noone
    }, 
     {
        objeto: obj_bloco_print,
        offset_x: 180,
        offset_y: -140, 
        linha_inicial: noone
    }

    ];


global.paginas_spawn_data[1] = [
        {
        seq_certa: [1],
        seq_certa_mini:  [2]
    },
     {
        frase: "CHOQUE"
    },
  
    {
        objeto: obj_bloco_print,
        offset_x: 180,
        offset_y: -100,
        linha_inicial: noone, // noone = vai pro inventário | numero (0-8) = encaixa direto no slot
    },
    {
        objeto: obj_bloco_choque,
        offset_x: 100,
        offset_y: 1, 
        linha_inicial: noone
    }
];

global.paginas_spawn_data[2] = [
    {
        seq_certa: [3, 4, 5, 6, 1],
        seq_certa_mini:  [7, 8,9]
    },
    {
        frase: "Musicas Melosas"
    },
    
    {
        objeto: obj_bloco_import_time,
        offset_x: 180,
        offset_y: -220,
        linha_inicial: noone, // noone = vai pro inventário | numero (0-8) = encaixa direto no slot
    },
    {
        objeto: obj_bloco_import_ply_snd,
        offset_x: 180,
        offset_y: -140, 
        linha_inicial: noone
    },
    
       {
        objeto: obj_bloco_ply_snd,
        offset_x: 180,
        offset_y: -60, 
        linha_inicial: noone
    },
    
        {
        objeto: obj_bloco_timesleep,
        offset_x: 180,
        offset_y: 20, 
        linha_inicial: noone
    },
    
    {
        objeto: obj_bloco_print,
        offset_x: 180,
        offset_y: 100, 
        linha_inicial: noone
    },
    
    {
        objeto: obj_bloco_fita,
        offset_x: 180,
        offset_y: 180, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_5,
        offset_x: 100,
        offset_y: 180, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_boom,
        offset_x: 260,
        offset_y: 180, 
        linha_inicial: noone
    }
    ];

    global.paginas_spawn_data[3] = [
    {
        seq_certa: [10,1],
        seq_certa_mini:  [11, 12, 13, 14, 8, 11]
    },
    {
        frase: "Super Ventoinha!"
    },
    
    {
        objeto: obj_bloco_operacoes,
        offset_x: 180,
        offset_y: -220,
        linha_inicial: noone, // noone = vai pro inventário | numero (0-8) = encaixa direto no slot
    },
    {
        objeto: obj_bloco_print,
        offset_x: 180,
        offset_y: -140, 
        linha_inicial: noone
    },
    
 
    {
        objeto: obj_bloco_vent,
        offset_x: 180,
        offset_y: -60, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual,
        offset_x: 100,
        offset_y: -60, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_spr_vent,
        offset_x: 260,
        offset_y: -60, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_mult,
        offset_x: 180,
        offset_y: 20, 
        linha_inicial: noone
    },
       {
        objeto: obj_bloco_num_5,
        offset_x: 100,
        offset_y: 20, 
        linha_inicial: noone
    },
    {
    objeto: obj_bloco_spr_vent,
        offset_x: 260,
        offset_y: 20, 
        linha_inicial: noone
    },  
    
];

global.paginas_spawn_data[4] = [
    {
        seq_certa: [3, 10, 15, 10, 6, 25, 16, 10, 26],
        seq_certa_mini: [17, 12, 24, 17, 19, 22, 17, 21, 12, 23, 23, 17, 12, 12, 22, 18, 20, 12, 23]
    },
    {
        frase: "Reiniciando..."
    },
    
    // --- ESTRUTURAS DE CONTROLE (While e If) ---
    {
        objeto: obj_bloco_while,
        offset_x: 125,
        offset_y: -240, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_if,
        offset_x: 245,
        offset_y: -240, 
        linha_inicial: noone
    },

    // --- VARIÁVEIS / TEMPO / GERAIS ---
    {
        objeto: obj_bloco_import_time,
        offset_x: 125,
        offset_y: -170,
        linha_inicial: noone, 
    },
    {
        objeto: obj_bloco_timesleep,
        offset_x: 245,
        offset_y: -170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_relogio,
        offset_x: 75,
        offset_y: -100, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_relogio,
        offset_x: 125,
        offset_y: -100, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_relogio,
        offset_x: 175,
        offset_y: -100, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_relogio,
        offset_x: 225,
        offset_y: -100, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_coracao,
        offset_x: 275,
        offset_y: -100, 
        linha_inicial: noone
    },

    // --- OPERADORES MATEMÁTICOS E LÓGICOS ---
    {
        objeto: obj_bloco_operacoes,
        offset_x: 100,
        offset_y: -30, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_operacoes,
        offset_x: 150, // <- Adicionado aqui (mais um de operação)
        offset_y: -30, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_operacoes,
        offset_x: 235,
        offset_y: -30, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_maior,
        offset_x: 75,
        offset_y: 40, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual,
        offset_x: 125,
        offset_y: 40, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual,
        offset_x: 175,
        offset_y: 40, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual,
        offset_x: 225,
        offset_y: 40, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual,
        offset_x: 275,
        offset_y: 40, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_igual, // <- Adicionado aqui (mais um igual)
        offset_x: 150,
        offset_y: 110, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_mais,
        offset_x: 95,
        offset_y: 110, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_menos,
        offset_x: 235,
        offset_y: 110, 
        linha_inicial: noone
    },

    // --- NÚMEROS ---
    {
        objeto: obj_bloco_num_0,
        offset_x: 85,
        offset_y: 170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_0,
        offset_x: 135,
        offset_y: 170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_1,
        offset_x: 185,
        offset_y: 170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_1,
        offset_x: 235,
        offset_y: 170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_1,
        offset_x: 285,
        offset_y: 170, 
        linha_inicial: noone
    },
    {
        objeto: obj_bloco_num_3,
        offset_x: 185,
        offset_y: 230, 
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
        
        if (!variable_struct_exists(_dados, "objeto")) {
            continue;
        }
        
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
    var _espacamento_x = 47;

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
        _slot.posicao = j;
        _slot.offset_livro_x = -270 + (j* _espacamento_x) ;
        _slot.offset_livro_y = - 200 + (i * _espacamento_y);
        show_debug_message("Criado Slot Mini -> Linha: " + string(i) + " | Posicao (j): " + string(j));
    }
    
    
}
    slots_criados = true
}


verificacao = function(pagina_atual){
    
    if (pagina_atual >= array_length(global.paginas_spawn_data)) return;
        
    var _lista_blocos = global.paginas_spawn_data[pagina_atual];
    
     for (var n = 0; n < array_length(_lista_blocos); n++){
        
        var _dados = _lista_blocos[n];
        
        if (!variable_struct_exists(_dados, "seq_certa")) {
            continue;
        }
        
        
    var _grande = false
    var _mini = false
    
    
    var _sequencia_jogador = [];

    for (var i = 0; i < 9; i++) {
        var _valor_da_linha = -1;
        
        with (obj_block_parent) {
            var _slot_pai = instance_place(x, y, obj_colission_bl);
            if (_slot_pai != noone && _slot_pai.linha == i) {
                _valor_da_linha = valor_conferencia;
                show_debug_message(_valor_da_linha);
            }
        }
        
        if (_valor_da_linha != -1) {
            array_push(_sequencia_jogador, _valor_da_linha);
        }
    }

        
            show_debug_message(_sequencia_jogador)
        
        
        
    var _receita_correta = _dados.seq_certa;

    if (array_equals(_sequencia_jogador, _receita_correta)) {
        show_debug_message("Feitiço correto!");
     _grande = true
    }
        
    var _sequencia_mini_jogador = [];

    for (var ix = 0; ix < 9; ix++) {
        for (var jx = 0; jx < 5; jx++) {
            var _valor_encontrado = -1;
            
            with (obj_mini_parent) {
                var _slot_mini = instance_place(x, y, obj_colission_mini);
                
                if (_slot_mini != noone && _slot_mini.linha == ix && _slot_mini.posicao == jx) {
                    _valor_encontrado = valor_conferencia; 
                    show_debug_message(_valor_encontrado);
                }
            }
            
            if (_valor_encontrado != -1) {
                array_push(_sequencia_mini_jogador, _valor_encontrado);
            }
        }
    }
    var _receita_mini_correta = _dados.seq_certa_mini;

    if (array_equals(_sequencia_mini_jogador, _receita_mini_correta)) {
        show_debug_message("Sequência dos mini blocos correta!");
        _mini = true
    }
    
    if (_mini = true && _grande == true){
        show_debug_message("Parabéns!");
        desenhar = true
    }
}
}

