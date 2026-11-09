if (game_over) {
    // Fundo preto
    draw_set_color(c_black);
    draw_rectangle(
        0, 0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    // GAME OVER
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_red);

    draw_text_transformed(
        display_get_gui_width() / 2,
        display_get_gui_height() / 2 - 40,
        "GAME OVER",
        3,
        3,
        0
    );

    // Texto para reiniciar
    draw_set_color(c_white);

    draw_text_transformed(
        display_get_gui_width() / 2,    
        display_get_gui_height() / 2 + 40,
        "Pressione P para reiniciar",
        1.5,
        1.5,
        0
    );

    draw_set_color(c_white);
}

if (!game_over) {
    if (!instance_exists(obj_dialogo)){
         var _P = 4;                 // tamanho de cada pixel na tela (mude aqui para aumentar/diminuir)
    var _ox = 24, _oy = 24;     // posição na tela

    // layout em pixels lógicos
    var _segs = bat_segs;
    var _sw = 4, _sh = 8, _sg = 1;
    var _W = 4 + _segs * _sw + (_segs - 1) * _sg;   // largura do corpo
    var _H = 4 + _sh;                               // altura do corpo

    // cores
    var _pct = clamp(hp / hp_max, 0, 1);
    var _cor = c_lime;
    if (_pct <= 0.5)  _cor = c_yellow;
    if (_pct <= 0.25) _cor = c_red;

    var _piscando = (bat_pisca > 0) && ((bat_pisca div 4) mod 2 == 0);
    var _cor_borda = c_white;
    if (_piscando) _cor_borda = c_red;
    else if (_pct <= 0.25 && ((current_time div 400) mod 2 == 0)) _cor_borda = c_red;

    // fundo (interior)
    pix_rect(_ox, _oy, _P, 1, 1, _W - 1, _H - 1, c_black);

    // contorno de 1 pixel com cantos cortados (4 lados, sem os cantos)
    pix_rect(_ox, _oy, _P, 1, 0, _W - 1, 1, _cor_borda);         // topo
    pix_rect(_ox, _oy, _P, 1, _H - 1, _W - 1, _H, _cor_borda);   // base
    pix_rect(_ox, _oy, _P, 0, 1, 1, _H - 1, _cor_borda);         // esquerda
    pix_rect(_ox, _oy, _P, _W - 1, 1, _W, _H - 1, _cor_borda);   // direita

    // ponta da bateria
    pix_rect(_ox, _oy, _P, _W, 3, _W + 2, _H - 3, _cor_borda);

    // segmentos
    var _seg_val = hp_max / _segs;
    for (var i = 0; i < _segs; i++) {
        var _x1 = 2 + i * (_sw + _sg);
        var _y1 = 2;
        var _limite = i * _seg_val;

        if (hp > _limite) {
            pix_rect(_ox, _oy, _P, _x1, _y1, _x1 + _sw, _y1 + _sh, _cor);
            // brilho em cima e sombra embaixo (1 pixel cada)
            pix_rect(_ox, _oy, _P, _x1, _y1, _x1 + _sw, _y1 + 1, merge_color(_cor, c_white, 0.5));
            pix_rect(_ox, _oy, _P, _x1, _y1 + _sh - 1, _x1 + _sw, _y1 + _sh, merge_color(_cor, c_black, 0.4));
        } else if (hp_fantasma > _limite && _piscando) {
            pix_rect(_ox, _oy, _P, _x1, _y1, _x1 + _sw, _y1 + _sh, c_white);
        } else {
            pix_rect(_ox, _oy, _P, _x1, _y1, _x1 + _sw, _y1 + _sh, c_dkgray);
        }
    }

    draw_set_color(c_white);
    }
}