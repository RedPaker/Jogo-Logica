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
    var _segs = bat_segs;
    var _seg_val = hp_max / _segs;
    
    // AUMENTADO EM ~20% (valores multiplicados por 1.2):
    var _seg_w = 20, _seg_h = 31, _gap = 4, _pad = 5;
    
    var _bx = 24, _by = 24;
    var _bw = _pad * 2 + _segs * _seg_w + (_segs - 1) * _gap;
    var _bh = _pad * 2 + _seg_h;

    // cor dos segmentos conforme a vida
    var _pct = clamp(hp / hp_max, 0, 1);
    var _cor = c_lime;
    if (_pct <= 0.5)  _cor = c_yellow;
    if (_pct <= 0.25) _cor = c_red;

    // piscar de dano (alterna a cada 4 frames) e piscar lento de vida baixa
    var _piscando = (bat_pisca > 0) && ((bat_pisca div 4) mod 2 == 0);
    var _cor_borda = c_white;
    if (_piscando) _cor_borda = c_red;
    else if (_pct <= 0.25 && ((current_time div 400) mod 2 == 0)) _cor_borda = c_red;

    // fundo do corpo
    draw_set_color(c_black);
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, false);

    // ponta da bateria (ajustada proporcionalmente)
    draw_set_color(_cor_borda);
    draw_rectangle(_bx + _bw, _by + _bh * 0.3, _bx + _bw + 5, _by + _bh * 0.7, false);

    // segmentos
    for (var i = 0; i < _segs; i++) {
        var _sx = _bx + _pad + i * (_seg_w + _gap);
        var _sy = _by + _pad;
        var _limite = i * _seg_val;

        if (hp > _limite) {
            draw_set_color(_cor);                                   
        } else if (hp_fantasma > _limite && _piscando) {
            draw_set_color(c_white);                    
        } else {    
            draw_set_color(c_dkgray);                    
        }
        draw_rectangle(_sx, _sy, _sx + _seg_w, _sy + _seg_h, false);
    }

    // contorno (2px)
    draw_set_color(_cor_borda);
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, true);
    draw_rectangle(_bx + 1, _by + 1, _bx + _bw - 1, _by + _bh - 1, true);

    draw_set_color(c_white);
}