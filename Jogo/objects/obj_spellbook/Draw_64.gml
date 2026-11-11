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
// (só os blocos disponíveis na página da direita somem; o programa
//  montado na área de código continua visível para comparar com o Log)
var _vis = (aba_atual != 1);
with (obj_block_parent) {
    visible = _vis || encaixado || arrastando || e_cauda();
}
with (obj_mini_parent) {
    visible = _vis || arrastando || (instance_place(x, y, obj_colission_mini) != noone);
}

    if (tut_ativo && instance_exists(tut_alvo)){
        tut_alvo.visible = false;
        obj_mini_parent.visible = false
    } 
    
var _bloqueada = pagina_bloqueada(pagina_atual);

if (!_bloqueada) {
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
} else {
    // --- pagina bloqueada: lado direito sem blocos, so o aviso ---
    var _bx = _centro_x + 185;   // meio da pagina da direita
    var _by = _centro_y - 60;
    var _p  = 4;                 // tamanho do "pixel" do cadeado

    // eu quando o claude faz um sprite a mão com draw 😭
    draw_sprite_ext(spr_lock, 0, _bx, _by, _p, _p, 0, c_white, 1);

    draw_set_font(fnt_10_comicsansms);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_transformed(_bx, _by + 70, "PAGINA BLOQUEADA", 1.5, 1.5, 0);
    draw_text_ext_transformed(_bx, _by + 115,
        "Encontre a pagina \"" + pagina_titulo(pagina_atual) + "\" pelo mundo (tecla Z para pegar) para poder programar e desbloquear este poder.",
        22, 200, 1.2, 1.2, 0);
    draw_set_halign(fa_left);
}

    // --- título do feitiço (acima da área de código) e número da página ---
    draw_set_font(fnt_10_comicsansms);
    draw_set_color(c_black);
    draw_set_valign(fa_middle);

    if (pagina_atual >= 0 && pagina_atual < array_length(global.paginas_spawn_data)) {
        var _lista_pagina = global.paginas_spawn_data[pagina_atual];

        // procura o item com a "frase" (título) da página
        for (var i = 0; i < array_length(_lista_pagina); i++) {
            if (variable_struct_exists(_lista_pagina[i], "frase")) {
                draw_set_halign(fa_center);
                draw_text_transformed(_centro_x - 180, _centro_y - 260, _lista_pagina[i].frase, 1.7, 1.7, 0);
                break;
            }
        }

        // número da página: canto inferior direito da página direita
        draw_set_halign(fa_right);
        draw_text_transformed(_centro_x + 400, _centro_y + 250, string(pagina_atual + 1), 1.7, 1.7, 0);
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
// --- tutorial: escurece a tela e destaca o bloco ---
// --- tutorial: escurece a tela deixando um "buraco" no foco ---
if (tut_alpha > 0) {
    var _W = display_get_gui_width();
    var _H = display_get_gui_height();
    var _fl = 0, _ft = 0, _fr = 0, _fb = 0, _tem_foco = false;

    var _i = min(tut_idx, array_length(tut_fila) - 1);
    if (_i >= 0) {
        var _ps = tut_fila[_i];
        if (_ps.area != undefined) {
            _fl = _ps.area.l - 6;  _ft = _ps.area.t - 6;
            _fr = _ps.area.r + 6;  _fb = _ps.area.b + 6;
            _tem_foco = true;
        } else if (_ps.alvo != noone && instance_exists(_ps.alvo)) {
            var _camx = camera_get_view_x(view_camera[0]);
            var _camy = camera_get_view_y(view_camera[0]);
            _fl = _ps.alvo.bbox_left - _camx - 8;   _ft = _ps.alvo.bbox_top - _camy - 8;
            _fr = _ps.alvo.bbox_right - _camx + 8;  _fb = _ps.alvo.bbox_bottom - _camy + 8;
            _tem_foco = true;
        }
    }

    draw_set_alpha(tut_alpha);
    draw_set_color(c_black);
    if (_tem_foco) {
        draw_rectangle(0, 0, _W, _ft, false);        // em cima
        draw_rectangle(0, _fb, _W, _H, false);       // embaixo
        draw_rectangle(0, _ft, _fl, _fb, false);     // esquerda
        draw_rectangle(_fr, _ft, _W, _fb, false);    // direita
    } else {
        draw_rectangle(0, 0, _W, _H, false);
    }
    draw_set_alpha(1);

    if (_tem_foco && tut_ativo) {
        var _g = 2 + sin(current_time / 150) * 1.5;   // moldura pulsando
        draw_set_color(c_yellow);
        draw_rectangle(_fl - _g, _ft - _g, _fr + _g, _fb + _g, true);
        draw_rectangle(_fl - _g - 1, _ft - _g - 1, _fr + _g + 1, _fb + _g + 1, true);
    }
    draw_set_color(c_white);
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


// --- aviso de pagina coletada (aparece com o livro fechado) ---
if (!abrir && global.aviso_pagina_tempo > 0) {
    var _gx = display_get_gui_width() / 2;
    var _gy = display_get_gui_height() - 120;
    draw_set_font(fnt_10_comicsansms);
    draw_set_alpha(min(1, global.aviso_pagina_tempo / 30));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _w = string_width(global.aviso_pagina_texto) * 1.4 / 2 + 24;
    var _h = string_height(global.aviso_pagina_texto) * 1.4 / 2 + 14;
    draw_set_color(c_black);
    draw_rectangle(_gx - _w, _gy - _h, _gx + _w, _gy + _h, false);
    draw_set_color(c_white);
    draw_text_transformed(_gx, _gy, global.aviso_pagina_texto, 1.4, 1.4, 0);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
