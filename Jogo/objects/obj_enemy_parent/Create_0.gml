alvo_x = x;
alvo_y = y;

hp = 50;

move_spd = 0.5;
alarm[0] = 60;

distance_to_player = 100;

tilemap_foreground = layer_tilemap_get_id("tlm_fg");//fala onde colidir
tilemap_background = layer_tilemap_get_id("tlm_bg");

empurra = 0;

empurra_dir = 0;

dano_time = 0;