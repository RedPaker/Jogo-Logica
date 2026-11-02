if (global.puzzle_ram_concluido) exit;
if (!instance_exists(obj_plr_rpg)) exit;

var _dist = point_distance(x, y, obj_plr_rpg.x, obj_plr_rpg.y);

if (_dist <= distancia_interacao && keyboard_check_pressed(global.st_use)) {
    interagindo = !interagindo;

    var _layer = layer_get_id("UILayer_2");

    if (_layer != -1) {
        layer_set_visible(_layer, interagindo);
    }

    if (interagindo) {
        global.numero_puzzle = irandom_range(1, 4);
        global.puzzle_acertos = 0;
        tempo_puzzle = room_speed * 2;

        var _texto = layer_text_get_id(_layer, "text_4B58F36B");

        if (_texto != -1) {
            layer_text_text(_texto, string(global.numero_puzzle));
        }
    }
}

if (interagindo) {
    tempo_puzzle--;

    if (tempo_puzzle <= 0) {
        interagindo = false;

        var _layer = layer_get_id("UILayer_2");

        if (_layer != -1) {
            layer_set_visible(_layer, false);
        }
    }
}

if (interagindo && keyboard_check_pressed(vk_escape)) {
    interagindo = false;

    var _layer = layer_get_id("UILayer_2");

    if (_layer != -1) {
        layer_set_visible(_layer, false);
    }
}