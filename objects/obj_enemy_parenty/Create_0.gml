alvo_x = x;
alvo_y = y;

move_spd = 2;
alarm[0] = 60;

distance_to_player = 100;

tilemap_foreground = layer_tilemap_get_id("tlm_fg");//fala onde colidir
tilemap_background = layer_tilemap_get_id("tlm_bg");