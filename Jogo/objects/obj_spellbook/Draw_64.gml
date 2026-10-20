if (abrir) {

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
    
    if (pagina_atual >= 0 && pagina_atual < array_length(global.paginas_spawn_data)) {
        var _lista_pagina = global.paginas_spawn_data[pagina_atual];
        
        // Pega o primeiro item (onde fica a frase)
        if (array_length(_lista_pagina) > 0) {
            var _primeiro_item = _lista_pagina[0];
            
            if (variable_struct_exists(_primeiro_item, "frase")) {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_color(c_black);
                
                // Desenha o título no topo da página esquerda (ajuste os offsets X e Y se precisar)
                draw_text_transformed(_centro_x - 180, _centro_y - 260, _primeiro_item.frase,1.7,1.7,0);
            } 
        }
    }
}
