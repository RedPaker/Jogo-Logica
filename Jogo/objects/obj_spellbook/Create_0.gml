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
    var _espacamento_x = 46;

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



aba_atual = 0;        // 0 = Código, 1 = Log
codigo_linhas = array_create(9, "");
log_linhas = [];      // cada item: { linha, msg, ok }

// Lê o que o jogador montou, guardando a linha de cada bloco
coletar_programa = function() {
    var _res = {
        grande: [], grande_linha: [], grande_texto: [],
        mini: [],   mini_linha: [],   mini_texto: []
    };

    for (var i = 0; i < 9; i++) {
        with (obj_block_parent) {
            var _slot = instance_place(x, y, obj_colission_bl);
            if (_slot != noone && _slot.linha == i) {
                array_push(_res.grande, valor_conferencia);
                array_push(_res.grande_linha, i);
                array_push(_res.grande_texto, variable_instance_exists(id, "texto_codigo") ? texto_codigo : string(valor_conferencia));
            }
        }
        for (var j = 0; j < 5; j++) {
            with (obj_mini_parent) {
                var _slot_m = instance_place(x, y, obj_colission_mini);
                if (_slot_m != noone && _slot_m.linha == i && _slot_m.posicao == j) {
                    array_push(_res.mini, valor_conferencia);
                    array_push(_res.mini_linha, i);
                    array_push(_res.mini_texto, variable_instance_exists(id, "texto_codigo") ? texto_codigo : string(valor_conferencia));
                }
            }
        }
    }
    return _res;
}

// Monta o texto de cada linha para a aba Código
atualizar_codigo = function() {
    var _p = coletar_programa();
    for (var i = 0; i < 9; i++) codigo_linhas[i] = "";

    for (var k = 0; k < array_length(_p.grande); k++) {
        codigo_linhas[_p.grande_linha[k]] = _p.grande_texto[k];
    }
    for (var k = 0; k < array_length(_p.mini); k++) {
        var _l = _p.mini_linha[k];
        codigo_linhas[_l] += (codigo_linhas[_l] == "" ? "" : " ") + _p.mini_texto[k];
    }
}

// Compara uma sequência e devolve o primeiro erro (com a linha)
comparar_sequencia = function(_jogador, _linhas, _correta, _nome) {
    var _erros = [];
    var _n = min(array_length(_jogador), array_length(_correta));

    for (var k = 0; k < _n; k++) {
        if (_jogador[k] != _correta[k]) {
            array_push(_erros, { linha: _linhas[k], ok: false, msg: _nome + " errado ou fora de ordem." });
            return _erros;
        }
    }
    if (array_length(_jogador) > array_length(_correta)) {
        array_push(_erros, { linha: _linhas[_n], ok: false, msg: _nome + " sobrando." });
    } else if (array_length(_jogador) < array_length(_correta)) {
        var _ult = (_n > 0) ? _linhas[_n - 1] : -1;
        array_push(_erros, { linha: _ult + 1, ok: false, msg: "Faltam " + _nome + " a partir daqui." });
    }
    return _erros;
}

verificacao = function(pagina_atual) {
    log_linhas = [];
    if (pagina_atual >= array_length(global.paginas_spawn_data)) return;

    var _lista = global.paginas_spawn_data[pagina_atual];
    var _certa = [], _certa_mini = [];
    for (var n = 0; n < array_length(_lista); n++) {
        if (variable_struct_exists(_lista[n], "seq_certa")) {
            _certa = _lista[n].seq_certa;
            _certa_mini = _lista[n].seq_certa_mini;
        }
    }

    var _p = coletar_programa();

    if (array_length(_p.grande) == 0 && array_length(_p.mini) == 0) {
        array_push(log_linhas, { linha: -1, ok: false, msg: "Nenhum bloco encaixado." });
        aba_atual = 1;
        return;
    }

    var _e1 = comparar_sequencia(_p.grande, _p.grande_linha, _certa, "Bloco");
    var _e2 = comparar_sequencia(_p.mini, _p.mini_linha, _certa_mini, "Mini bloco");
    for (var i = 0; i < array_length(_e1); i++) array_push(log_linhas, _e1[i]);
    for (var i = 0; i < array_length(_e2); i++) array_push(log_linhas, _e2[i]);

    if (array_length(log_linhas) == 0) {
        array_push(log_linhas, { linha: -1, ok: true, msg: "Nenhum erro. Programa correto!" });
        desenhar = true;
    }
    //aba_atual = 1
}

fonte_terminal = fnt_10_sourcecodepro;   // troque por uma fonte pixel (veja abaixo)
px = 4;                                // tamanho do "pixel" do painel

cor_term_fundo     = make_color_rgb(8, 14, 10);
cor_term_verde     = make_color_rgb(70, 255, 110);
cor_term_verde_esc = make_color_rgb(20, 90, 40);
cor_term_erro      = make_color_rgb(255, 90, 90);

// retângulo com cantos cortados em degrau, alinh   ado à grade de pixels
painel_pixel = function(_x1, _y1, _x2, _y2, _borda, _fundo) {
    var _p = px;
    _x1 = floor(_x1 / _p) * _p;  _y1 = floor(_y1 / _p) * _p;
    _x2 = floor(_x2 / _p) * _p;  _y2 = floor(_y2 / _p) * _p;

    draw_set_color(_borda);
    draw_rectangle(_x1 + _p, _y1, _x2 - _p - 1, _y2 - 1, false);
    draw_rectangle(_x1, _y1 + _p, _x2 - 1, _y2 - _p - 1, false);

    draw_set_color(_fundo);
    draw_rectangle(_x1 + _p, _y1 + _p, _x2 - _p - 1, _y2 - _p - 1, false);
}

// painel completo de terminal com scanlines
painel_terminal = function(_x1, _y1, _x2, _y2) {
    painel_pixel(_x1, _y1, _x2, _y2, cor_term_verde, cor_term_fundo);

    draw_set_alpha(0.18);
    draw_set_color(c_black);
    for (var _yy = _y1 + px * 2; _yy < _y2 - px; _yy += px * 2) {
        draw_rectangle(_x1 + px, _yy, _x2 - px - 1, _yy + 1, false);
    }
    draw_set_alpha(1);
}

