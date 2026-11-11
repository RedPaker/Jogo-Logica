draw_set_alpha(alfa);
draw_set_font(fnt_8_segoeui);

var texto = string_concat("Aperte ", chr(global.st_run), " para correr.");
var multiplicador = 3;

var largura_texto = string_width(texto) * multiplicador;
var altura_texto = string_height(texto) * multiplicador;

var padding_x = 40 * multiplicador; 
var padding_y = 8 * multiplicador; 
var largura_final = largura_texto + padding_x;
var altura_final = altura_texto + padding_y;

var escala_x = largura_final / sprite_get_width(spr_ui_frame_4x);
var escala_y = altura_final / sprite_get_height(spr_ui_frame_4x);

var tela_largura = display_get_gui_width();
var tela_altura = display_get_gui_height();

var meio_x = tela_largura / 2;

var pos_y = tela_altura - (60 * multiplicador); 

var caixa_x = meio_x - (largura_final / 2);
var caixa_y = pos_y - (altura_final / 2);


draw_sprite_ext(spr_ui_frame_4x, 0, caixa_x, caixa_y, escala_x, escala_y, 0, c_white, alfa);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(meio_x, pos_y, texto, multiplicador, multiplicador, 0);


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);