if (!abrir) exit;

var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _lista = categoria == 0 ? global.inv : global.feiticos;
var _total = array_length(_lista);

draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);

if (categoria == 0) {
    draw_text(50, 50, "> ITENS");
    draw_text(50, 90, "  FEITICOS");
} else {
    draw_text(50, 50, "  ITENS");
    draw_text(50, 90, "> FEITICOS");
}

draw_set_color(c_white);

for (var i = 0; i < _total; i++) {
    var _y = 90 + i * 42;

    if (i == inv_teclado) {
        draw_set_color(c_yellow);
        draw_text(_w - 310, _y, ">");
    } else {
        draw_set_color(c_white);
    }

    draw_text(_w - 280, _y, _lista[i].name);
}

if (_total > 0) {
    var _selecionado = clamp(inv_teclado, 0, _total - 1);
    var _item = _lista[_selecionado];

    draw_set_color(c_white);
    draw_set_halign(fa_center);

    if (categoria == 0) {
        if (variable_struct_exists(_item, "sprite") && sprite_exists(_item.sprite)) {
            draw_sprite(_item.sprite, 0, _w * 0.45, _h * 0.35);
        }
    }

    draw_text_transformed(
        _w * 0.45,
        _h * 0.48,
        _item.name,
        1.3,
        1.3,
        0
    );

    var _descricao = "Sem descricao.";

    if (categoria == 1) {
        _descricao = _item.description;
    }
    else if (variable_struct_exists(_item, "descricao")) {
        _descricao = _item.descricao;
    }

    draw_set_halign(fa_left);
    draw_text_ext(
        _w * 0.25,
        _h * 0.58,
        _descricao,
        8,
        _w * 0.4
    );
}
else {
    draw_set_color(c_gray);
    draw_set_halign(fa_center);
    draw_text(_w * 0.45, _h * 0.48, "Vazio");
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);