if (!ativo) exit;

draw_set_font(fnt_16_comicsansms);
var _esc = 1.5;
var _w = floor(string_width(texto) * _esc + 56);
var _h = 56;
var _e = 1 - power(1 - anim, 3);
var _x = display_get_gui_width() - _w - 24;   // encostado na direita
var _y = floor(lerp(-_h - 8, 20, _e));
var _p = 4;   // tamanho do "pixel"

// borda clara, miolo escuro, cantos em degrau
draw_set_color(c_white);
draw_rectangle(_x + _p, _y, _x + _w - _p - 1, _y + _h - 1, false);
draw_rectangle(_x, _y + _p, _x + _w - 1, _y + _h - _p - 1, false);
draw_set_color(make_color_rgb(20, 20, 40));
draw_rectangle(_x + _p * 2, _y + _p, _x + _w - _p * 2 - 1, _y + _h - _p - 1, false);
draw_rectangle(_x + _p, _y + _p * 2, _x + _w - _p - 1, _y + _h - _p * 2 - 1, false);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(_x + 28, _y + _h / 2, texto, _esc, _esc, 0);
draw_set_valign(fa_top);