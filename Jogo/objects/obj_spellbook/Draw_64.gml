if (abrir) {
    
    draw_set_font(fnt_10_comicsansms)

    // 1. Fundo escuro
    draw_set_alpha(0.8);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1.0);

    // 2. Sprite do Livro
    draw_sprite_ext(spr_livro_feiticos_principal, 0, 640, 360, 4, 4, 0, c_white, 1);

    // 3. Terminal (sprite)
var _centro_x = display_get_gui_width() / 2;
var _centro_y = display_get_gui_height() / 2;
var _cor_laranja = make_color_rgb(255, 160, 64); // ainda usado nas abas

var _ox = _centro_x - 320;   // mesmo canto superior esquerdo do retângulo antigo
var _oy = _centro_y - 250;

// escala para o sprite ocupar exatamente 280x485 (a área do retângulo antigo)
var _esc_x = 280 / sprite_get_width(spr_terminal);
var _esc_y = 485 / sprite_get_height(spr_terminal);

draw_sprite_ext(spr_terminal, 0, _ox, _oy, _esc_x, _esc_y, 0, c_white, 1);
    
    //Texto
    
    // --- esconde os blocos na aba Log ---
var _vis = (aba_atual != 1);
with (obj_block_parent)   visible = _vis;
with (obj_mini_parent)    visible = _vis;

// --- abas estilo terminal ---
draw_set_font(fonte_terminal);
var _rx = _centro_x + 40;
var _ry = _centro_y - 250;
var _nomes = ["Codigo", "Log"];
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

for (var a = 0; a < 2; a++) {
    var _ax1 = _rx + a * 110;
    var _ax2 = _ax1 + 100;
    var _ay2 = _ry + 36;

    if (mouse_check_button_pressed(mb_left) && point_in_rectangle(_mx, _my, _ax1, _ry, _ax2, _ay2)) {
        aba_atual = a;
    }

    var _ativa = (aba_atual == a);
    painel_pixel(_ax1, _ry, _ax2, _ay2,
                 cor_term_verde,
                 _ativa ? cor_term_verde : cor_term_fundo);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_ativa ? cor_term_fundo : cor_term_verde);
    draw_text(floor(_ax1 + 50), floor(_ry + 18), _nomes[a]);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- painel do Log ---
if (aba_atual == 1) {
    var _px1 = _rx - 8;
    var _py1 = _ry + 44;
    var _px2 = _rx + 300;
    var _py2 = _centro_y + 235;

    painel_terminal(_px1, _py1, _px2, _py2);

    // barra de título
    painel_pixel(_px1, _py1, _px2, _py1 + 28, cor_term_verde, cor_term_verde_esc);
    draw_set_color(cor_term_verde);
    draw_text(floor(_px1 + 14), floor(_py1 + 5), "livro@feitico:~$ log");

    var _tx = floor(_rx + 6);
    var _ty = floor(_py1 + 44);

    if (array_length(log_linhas) == 0) {
        draw_set_color(cor_term_verde);
        draw_text_ext(_tx, _ty, "> Aperte ENTER para testar o programa.", 24, 270);
        _ty += 56;
    } else {
        for (var i = 0; i < array_length(log_linhas); i++) {
            var _l = log_linhas[i];
            draw_set_color(_l.ok ? cor_term_verde : cor_term_erro);
            var _txt = "> " + (_l.linha >= 0 ? "[linha " + string(_l.linha + 1) + "] " : "") + _l.msg;
            draw_text_ext(_tx, _ty, _txt, 24, 270);
            _ty += string_height_ext(_txt, 24, 270) + 12;
        }
    }

    // cursor piscando
    if ((current_time div 500) mod 2 == 0) {
        draw_set_color(cor_term_verde);
        draw_text(_tx, _ty, "> _");
    }
    draw_set_color(c_black);
}
}


if (desenhar == true){
     var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;

 draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_green);
    
    draw_text_transformed(_centro_x + 220, _centro_y + 250, "Resenha", 4, 4, 0);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

}
