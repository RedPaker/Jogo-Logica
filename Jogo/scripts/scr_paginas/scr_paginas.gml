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


// =====================================================================
//  PODERES LIBERADOS PELAS PAGINAS
// ---------------------------------------------------------------------
//  Um poder so aparece na roda de feiticos e so pode ser usado depois
//  que o programa da pagina correspondente for montado corretamente
//  no livro (ENTER sem erros).
//
//  "id" e o numero do poder em global.meu / quadro de
//  spr_roda_feiticos_itens. "chave" e o nome em
//  obj_controller_mg.unlocked_spells.
//
//  >>> Para mudar qual pagina libera qual poder, altere SO esta tabela. <<<
// =====================================================================
function pagina_poder(_indice) {
    switch (_indice) {
        case 0: return { id: 1, chave: "cd",        nome: "Disparo de CD" }; // Arremesso de disco
        case 1: return { id: 2, chave: "shock",     nome: "Choque" };        // CHOQUE
        case 2: return { id: 3, chave: "jukebox",   nome: "Jukebox" };       // Musicas Melosas
        case 3: return { id: 4, chave: "ventoinha", nome: "Vento" };         // Super Ventoinha!
        case 4: return { id: 5, chave: "restart",   nome: "Cura" };          // Reiniciando...
    }
    return undefined; // pagina sem poder associado
}

// id do poder (1 a 7) -> chave em unlocked_spells
function poder_chave(_id) {
    switch (_id) {
        case 1: return "cd";
        case 2: return "shock";
        case 3: return "jukebox";
        case 4: return "ventoinha";
        case 5: return "restart";    // Cura
        case 6: return "brightness"; // Flash
        case 7: return "overheat";
    }
    return "";
}

// O poder _id ja foi liberado?
function poder_liberado(_id) {
    if (!instance_exists(obj_controller_mg)) return false;
    var _chave = poder_chave(_id);
    if (_chave == "") return false;
    var _lib = obj_controller_mg.unlocked_spells;
    return variable_struct_exists(_lib, _chave) && _lib[$ _chave] == true;
}

// Lista (em ordem) dos ids dos poderes ja liberados
function poderes_liberados() {
    var _lista = [];
    for (var _id = 1; _id <= 7; _id++) {
        if (poder_liberado(_id)) array_push(_lista, _id);
    }
    return _lista;
}

// Libera o poder da pagina. Devolve true se o poder era novo.
function liberar_poder_da_pagina(_indice) {
    var _poder = pagina_poder(_indice);
    if (_poder == undefined || !instance_exists(obj_controller_mg)) return false;
    if (poder_liberado(_poder.id)) return false;
    obj_controller_mg.unlocked_spells[$ _poder.chave] = true;
    return true;
}
