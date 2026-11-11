var _fg = layer_get_id("tlm_fg");

if (_fg != -1) {
    tilemap_foreground = layer_tilemap_get_id(_fg);
} else {
    tilemap_foreground = -1;
}