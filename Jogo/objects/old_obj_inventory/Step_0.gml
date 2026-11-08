if (keyboard_check_pressed(vk_escape)) {
    abrir = !abrir;
    global.inv_aberto = abrir;
    inv_teclado = 0;
    inv_selecionado = -1;
}

if (!abrir) exit;

if (keyboard_check_pressed(vk_left)) {
    categoria = max(0, categoria - 1);
    inv_teclado = 0;
    inv_selecionado = -1;
}

if (keyboard_check_pressed(vk_right)) {
    categoria = min(1, categoria + 1);
    inv_teclado = 0;
    inv_selecionado = -1;
}

var _lista = categoria == 0 ? global.inv : global.feiticos;
var _total = array_length(_lista);

if (_total > 0) {
    inv_teclado = clamp(inv_teclado, 0, _total - 1);

    if (keyboard_check_pressed(vk_up)) {
        inv_teclado = max(0, inv_teclado - 1);
    }

    if (keyboard_check_pressed(vk_down)) {
        inv_teclado = min(_total - 1, inv_teclado + 1);
    }

    if (keyboard_check_pressed(vk_enter)) {
        inv_selecionado = inv_teclado;
    }
} else {
    inv_teclado = 0;
    inv_selecionado = -1;
}