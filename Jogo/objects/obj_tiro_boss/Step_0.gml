var _h = lengthdir_x(velocidade, direcao);
var _v = lengthdir_y(velocidade, direcao);


if (tilemap_get_at_pixel( tilemap_foreground, x + _h, y + _v ) != 0) {
    instance_destroy();
} else {
    x += _h;
    y += _v;
}