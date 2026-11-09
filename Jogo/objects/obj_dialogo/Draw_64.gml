if (current_message < 0) exit;

var _e = ease_out_cubic(anim);

var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// quanto o balão está deslocado para baixo (0 = totalmente aberto)
var _slide = (1 - _e) * (_boxh + 300);

draw_sprite_stretched(spr_ui_frame, 0, _dx, _dy + _slide, _boxw, _boxh);

_dx += 16;
_dy += 16;

draw_set_font(fnt_16_comicsansms);

var _name = messages[current_message].name;
draw_set_colour(global.char_colors[$ _name]);
draw_text(_dx, _dy + _slide, _name);
draw_set_colour(c_white);

_dy += 40;
draw_text_ext_transformed(_dx, _dy + _slide, draw_message, -1, _boxw - (_dx * 2), 2, 2, 0);

// retrato com zoom: começa em 70% e passa um pouco de 100% antes de assentar
var _z = ease_out_back(zoom);
var _esc = 4 * lerp(0.7, 1, _z);

draw_set_alpha(min(1, zoom * 2));
draw_sprite_ext(global.sprites[$ _name], 0, _boxw - 120, _boxh + 250 + _slide, _esc, _esc, 0, c_white, 1);
draw_set_alpha(1);

if (!tem_alvo || current_message < 0) exit;

var _e = ease_out_cubic(anim);          // reaproveita o anim do balão
var _z = lerp(1, zoom_cam, _e);

var _w = cam_w0 / _z;
var _h = cam_h0 / _z;

// centro vai do centro original da câmera até o NPC
var _cx = lerp(cam_x0 + cam_w0 / 2, alvo_x, _e);
var _cy = lerp(cam_y0 + cam_h0 / 2, alvo_y, _e);

var _x = clamp(_cx - _w / 2, 0, room_width - _w);
var _y = clamp(_cy - _h / 2, 0, room_height - _h);

camera_set_view_size(cam, _w, _h);
camera_set_view_pos(cam, _x, _y);