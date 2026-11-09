// =====================================================================
//  PAGINAS DO LIVRO DE FEITICOS
// ---------------------------------------------------------------------
//  Cada pagina do livro (global.paginas_spawn_data) comeca BLOQUEADA.
//  Ela so libera os blocos de programacao depois que o jogador coleta
//  o objeto obj_pagina correspondente (tecla Z) pelo mundo.
//
//  A pagina coletada vai para o inventario (global.inv) como um item
//  com o campo "pagina" = indice da pagina no livro (comeca em 0):
//      0 = Arremesso de disco
//      1 = CHOQUE
//      2 = Musicas Melosas
//      3 = Super Ventoinha!
//      4 = Reiniciando...
// =====================================================================

// O jogador ja coletou a pagina _indice (0, 1, 2...)?
function pagina_coletada(_indice) {
    if (!variable_global_exists("inv")) return false;

    for (var i = 0; i < array_length(global.inv); i++) {
        var _item = global.inv[i];
        if (is_struct(_item) && variable_struct_exists(_item, "pagina") && _item.pagina == _indice) {
            return true;
        }
    }
    return false;
}

// A pagina existe no livro?
function pagina_existe(_indice) {
    if (!variable_global_exists("paginas_spawn_data")) return false;
    return (_indice >= 0 && _indice < array_length(global.paginas_spawn_data));
}

// A pagina existe mas o jogador ainda nao coletou: fica bloqueada.
function pagina_bloqueada(_indice) {
    return pagina_existe(_indice) && !pagina_coletada(_indice);
}

// Titulo da pagina (o item com "frase" em global.paginas_spawn_data)
function pagina_titulo(_indice) {
    if (!pagina_existe(_indice)) return "Pagina " + string(_indice + 1);

    var _lista = global.paginas_spawn_data[_indice];
    for (var i = 0; i < array_length(_lista); i++) {
        if (variable_struct_exists(_lista[i], "frase")) return _lista[i].frase;
    }
    return "Pagina " + string(_indice + 1);
}

// Mensagem rapida no meio da tela (desenhada pelo obj_spellbook)
function pagina_aviso(_texto) {
    global.aviso_pagina_texto = _texto;
    global.aviso_pagina_tempo = 180; // 3 segundos a 60 FPS
}
