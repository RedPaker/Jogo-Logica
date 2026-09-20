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
        "Pressione R para reiniciar",
        1.5,
        1.5,
        0
    );

    draw_set_color(c_white);
}