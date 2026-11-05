if (abrir) {
    
    draw_set_font(fnt_10_comicsansms)

    // 1. Fundo escuro
    draw_set_alpha(0.8);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1.0);

    // 2. Sprite do Livro
    draw_sprite_ext(spr_livro_feiticos_principal, 0, 640, 360, 6, 6, 0, c_white, 1);

    // 3. Retângulo Laranja
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _cor_laranja = make_color_rgb(255, 160, 64); 

    var _x1 = _centro_x - 320;
    var _y1 = _centro_y - 250;
    var _x2 = _centro_x - 40;
    var _y2 = _centro_y + 235;

    draw_rectangle_color(_x1, _y1, _x2, _y2, _cor_laranja, _cor_laranja, _cor_laranja, _cor_laranja, false);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    
    draw_text_transformed(_centro_x + 330, _centro_y + 250, string(pagina_atual + 1), 4, 4, 0);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    //Texto
    
    // --- esconde os blocos na aba Log ---
var _vis = (aba_atual != 1);
with (obj_block_parent)   visible = _vis;
with (obj_mini_parent)    visible = _vis;

// --- abas ---
var _rx = _centro_x + 40;
var _ry = _centro_y - 250;
var _nomes = ["Código", "Log"];
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

for (var a = 0; a < 2; a++) {
    var _ax1 = _rx + a * 110;
    var _ax2 = _ax1 + 100;
    var _ay2 = _ry + 36;

    if (mouse_check_button_pressed(mb_left) && point_in_rectangle(_mx, _my, _ax1, _ry, _ax2, _ay2)) {
        aba_atual = a;
    }

    var _cor = (aba_atual == a) ? _cor_laranja : make_color_rgb(190, 190, 190);
    draw_rectangle_color(_ax1, _ry, _ax2, _ay2, _cor, _cor, _cor, _cor, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(_ax1 + 50, _ry + 18, _nomes[a]);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- conteúdo da aba Log ---
if (aba_atual == 1) {
    var _ty = _ry + 55;
    if (array_length(log_linhas) == 0) {
        draw_set_color(c_black);
        draw_text_ext(_rx, _ty, "Aperte ENTER para testar o programa.", 24, 270);
    } else {
        for (var i = 0; i < array_length(log_linhas); i++) {
            var _l = log_linhas[i];
            draw_set_color(_l.ok ? c_green : c_red);
            var _txt = (_l.linha >= 0 ? "Linha " + string(_l.linha + 1) + ": " : "") + _l.msg;
            draw_text_ext(_rx, _ty + i * 60, _txt, 24, 270);
        }
    }
    draw_set_color(c_black);
}
    
    if (pagina_atual >= 0 && pagina_atual < array_length(global.paginas_spawn_data)) {
        var _lista_pagina = global.paginas_spawn_data[pagina_atual];

        if (array_length(_lista_pagina) > 0) {
            var _primeiro_item = _lista_pagina[1];
            if (variable_struct_exists(_primeiro_item, "frase")) {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_color(c_black);
                
                draw_text_transformed(_centro_x - 180, _centro_y - 260, _primeiro_item.frase,1.7,1.7,0);
                
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
            } 
        }
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
