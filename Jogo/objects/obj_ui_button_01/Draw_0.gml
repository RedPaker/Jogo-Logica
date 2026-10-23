draw_set_font(fnt_6_comicsansms);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Inherit the parent event
event_inherited();

if (wait==false) {
	draw_text_ext(x, y, chr(global.st_use), -1, sprite_width-10);
}
