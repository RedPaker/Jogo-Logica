draw_set_font(font_typeface);
draw_set_colour(font_color);
draw_set_halign(h_align);
draw_set_valign(v_align);

draw_self();

if(widthofthetext<=0){
    draw_text_ext(x+x_ofst, y+y_ofst, txt, -1, sprite_width-10);
}else {
	draw_text_ext(x+x_ofst, y+y_ofst, txt, -1, widthofthetext);
}



 