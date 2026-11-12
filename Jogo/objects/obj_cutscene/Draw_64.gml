var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);

if (spr != noone) {
    var _sw = sprite_get_width(spr);
    var _sh = sprite_get_height(spr);
    var _esc = max(_w / _sw, _h / _sh) * zoom;   // preenche a tela

    var _tx = 0, _ty = 0;
    if (shake_t > 0) {
        var _f = shake_t / shake_dur;
        _tx = random_range(-1, 1) * shake_mag * _f;
        _ty = random_range(-1, 1) * shake_mag * _f;
    }

    var _dx = _w / 2 + _tx - (_sw / 2 - sprite_get_xoffset(spr)) * _esc;
    var _dy = _h / 2 + _ty - (_sh / 2 - sprite_get_yoffset(spr)) * _esc;
    draw_sprite_ext(spr, frame, _dx, _dy, _esc, _esc, 0, c_white, 1);
}

if (flash_a > 0) {
    draw_set_alpha(flash_a);
    draw_set_color(c_white);
    draw_rectangle(0, 0, _w, _h, false);
}

if (fade_a > 0) {
    draw_set_alpha(fade_a);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
}

// --- INDICADOR PISCANDO (QUANDO AGUARDANDO TECLA) ---
if (aguardando_tecla) {
    // Faz o alpha oscilar com o tempo do jogo para criar o efeito de piscar
    var _alpha_pisca = (sin(current_time / 150) + 1) * 0.5; // varia de 0 a 1
    
    draw_set_alpha(_alpha_pisca);
    draw_set_color(c_white);
    
    // Desenha um quadradinho no canto inferior direito (ex: x = _w - 40, y = _h - 40, tamanho 16x16)
    draw_rectangle(_w - 48, _h - 48, _w - 24, _h - 24, false);
}

draw_set_alpha(1);
draw_set_color(c_white);