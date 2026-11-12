
if (!instance_exists(obj_plr_rpg)) exit;

var _dist = point_distance(x, y, obj_plr_rpg.x, obj_plr_rpg.y);
var _layer = layer_get_id("BinarioLayer");

if (tempo_mensagem > 0) {
    tempo_mensagem--;

    if (tempo_mensagem <= 0) {
        mensagem = "";
        resultado = false;

        if (_layer != -1) {
            layer_set_visible(_layer, false);
        }
    }
}

if (!resultado && tempo_mensagem <= 0 && !global.quests.binario) {

    if (_dist <= distancia_interacao && keyboard_check_pressed(global.st_use)) {
        interagindo = !interagindo;

        if (_layer != -1) {
            layer_set_visible(_layer, interagindo);
        }

        if (interagindo) {
            global.codigo_binario = "";
            mensagem = "";
            global.jogo_pausado = true;

            var _texto = layer_text_get_id(_layer, "text_5B88EC1D");

            if (_texto != -1) {
                layer_text_text(_texto, global.codigo_binario);
            }
        } else {
            global.jogo_pausado = false;
        }
    }
}

if (interagindo) {

    var _texto = -1;

    if (_layer != -1) {
        _texto = layer_text_get_id(_layer, "text_5B88EC1D");
    }

    if (keyboard_check_pressed(vk_enter)) {

        if (global.codigo_binario == senha_correta) {

            mensagem = "CORRETO!";
            global.quests.binario = true;

            with (obj_wall_puzzle) {
                instance_destroy();
            }

        } else {
            mensagem = "ERRO!";
        }

        interagindo = false;
        global.jogo_pausado = false;
        resultado = true;
        tempo_mensagem = 120;

        if (_texto != -1) {
            layer_text_text(_texto, mensagem);
        }

        global.codigo_binario = "";

    } else {

        if (_texto != -1) {
            layer_text_text(_texto, global.codigo_binario);
        }
    }
}

if (interagindo && keyboard_check_pressed(vk_escape)) {

    interagindo = false;
    global.codigo_binario = "";
    global.jogo_pausado = false;

    if (_layer != -1) {
        layer_set_visible(_layer, false);
    }
}
