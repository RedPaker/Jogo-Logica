alvo_x = x;
alvo_y = y;

hp = 50;
move_spd = 0.7;

alarm[0] = 60;

distance_to_player = 100;

tilemap_foreground = layer_tilemap_get_id("tlm_fg");
tilemap_background = layer_tilemap_get_id("tlm_bg");

empurra = 0;
empurra_dir = 0;

dano_time = 0;
tempo_piscada = 6;

estado = "perseguir";
tempo_estado = 0;
dash_vel = 8
dash_dir = 0

dash_tempo = 0;
dash_carga = 45;
dash_dura = 12
dash_recarga = 60


tempo_parir = 60;
filhos = 2
filhos_max = 6;