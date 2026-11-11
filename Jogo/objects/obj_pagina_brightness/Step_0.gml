// Mesmo sistema de coleta dos outros itens: encostar + tecla Z.
// (substitui o Step do obj_item_parent para guardar o numero da pagina)

if (variable_global_exists("jogo_pausado") && global.jogo_pausado) exit;

if (place_meeting(x, y, obj_plr_rpg) && keyboard_check_pressed(ord("Z"))) {

    if (!pagina_coletada(indice_pagina)) {
        var _titulo = pagina_titulo(indice_pagina);

        array_push(global.inv, {
            name: "Pagina " + string(numero_pagina) + ": " + _titulo,
            sprite: sprite_index,
            pagina: indice_pagina,
            descricao: "Pagina do livro de feiticos. Abra o livro ("+ string(chr(global.st_inv)) +") para programar \"" + _titulo + "\"."
        });

        pagina_aviso("Pagina coletada: " + _titulo + "\nAbra o livro ("+ string(chr(global.st_inv)) +") para programar o feitico.");
    }

    instance_destroy();
}
