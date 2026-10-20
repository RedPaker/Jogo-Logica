draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if ((tempo div 4) mod 2 == 0) {
    draw_set_color(c_red);
} else {
    draw_set_color(c_yellow);
}

draw_set_font(fnt_6_comicsansms)

draw_set_alpha(alpha);

draw_text(x, y, string(dano));


draw_set_alpha(1);
draw_set_color(c_yellow);