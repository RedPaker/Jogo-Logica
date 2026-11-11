var _gui_mx = device_mouse_x_to_gui(0);
var _gui_my = device_mouse_y_to_gui(0);

draw_set_font(fnt_6_segoeui); 
draw_set_halign(fa_left); 
draw_set_valign(fa_top);

var _escala = 3;
var _margem = 12 * _escala; 
var _sep = 16;
var _wrap_width = 128; 

var _texto_w = string_width_ext(texto, _sep, _wrap_width);
var _texto_h = string_height_ext(texto, _sep, _wrap_width);

var _largura = (_texto_w * _escala) + (_margem * 2);
var _altura = (_texto_h * _escala) + (_margem * 2);


var _pos_x = _gui_mx + 15;
var _pos_y = _gui_my + 15;


var _tela_w = display_get_gui_width();
var _tela_h = display_get_gui_height();


if (_pos_x + _largura > _tela_w) {
    _pos_x = _gui_mx - 15 - _largura;
}


if (_pos_y + _altura > _tela_h) {
    _pos_y = _gui_my - 15 - _altura;
}


draw_sprite_stretched(spr_ui_frame_4x, 0, _pos_x, _pos_y, _largura, _altura);

draw_set_color(c_white);
draw_set_alpha(1);
draw_text_ext_transformed(_pos_x + _margem, _pos_y + _margem, texto, _sep, _wrap_width, _escala, _escala, 0);