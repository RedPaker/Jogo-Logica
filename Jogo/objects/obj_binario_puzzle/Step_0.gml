
if (!instance_exists(obj_plr_rpg)) exit;


var _dist = point_distance(x, y, obj_plr_rpg.x, obj_plr_rpg.y);

if (_dist <= distancia_interacao && keyboard_check_pressed(global.st_use)) {

    interagindo = !interagindo;

    var _layer = layer_get_id("BinarioLayer");

    if (_layer != -1) {
        layer_set_visible(_layer, interagindo);
    }

    
    if (interagindo) {
        global.codigo_binario = "";

        var _texto = layer_text_get_id(_layer, "text_5B88EC1D");

        if (_texto != -1) {
            layer_text_text(_texto, global.codigo_binario);
        }
    }
}


if (interagindo && keyboard_check_pressed(vk_escape)) {
    interagindo = false;

    var _layer = layer_get_id("BinarioLayer");
    if (_layer != -1) {
        layer_set_visible(_layer, false);
    }
}