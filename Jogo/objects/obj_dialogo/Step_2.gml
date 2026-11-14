if (current_message < 0) exit;
    layer_set_visible("GuiLayer", false);

if (keyboard_check_pressed(skip_key) && estado != 2) {
    estado = 2;
}

// animação do balão
if (estado == 0) {
    anim = min(1, anim + anim_vel);
    if (anim >= 1) estado = 1;
} else if (estado == 2) {
    anim = max(0, anim - anim_vel);
    if (anim <= 0) {
        global.jogo_pausado = false;
        instance_activate_layer("Entities");
        instance_activate_layer("Itens");
        instance_activate_layer("Misc");
        layer_set_visible("GuiLayer", true);
        instance_destroy();
        exit;
    }
}

// zoom do retrato: reinicia quando troca quem fala
var _nome = messages[current_message].name;
if (_nome != ultimo_nome) {
    ultimo_nome = _nome;
    zoom = 0;
}
zoom = min(1, zoom + 0.07);

// texto e input só com o balão totalmente aberto
if (estado != 1) exit;

var _str = messages[current_message].msg;

if (current_char < string_length(_str)) {
    current_char += char_speed * (1 + (keyboard_check(input_key) * 2));
    draw_message = string_copy(_str, 1, floor(current_char));
} else if (keyboard_check_pressed(input_key)) {
    if (current_message + 1 >= array_length(messages)) {
        estado = 2;                 // começa a fechar
    } else {
        current_message++;
        current_char = 0;
        draw_message = "";
    }
}

if (current_message >= array_length(messages)){
    if (!global.cutscene_ativa) {
        global.jogo_pausado = false
        instance_activate_layer("Entities");
        instance_activate_layer("Itens");
        instance_activate_layer("Misc");
    }
    instance_destroy();
}