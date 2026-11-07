


/*move_spdy = 2; //velocidade y
move_spdx = 2;velocidade x*/
move_spd = 2;
tilemap_foreground = layer_tilemap_get_id("tlm_fg");//fala onde colidir
tilemap_background = layer_tilemap_get_id("tlm_bg");
inviswalls = obj_wall;
hspd = 0;
vspd = 0;

state = 0 //0-Jogando 1-Freezed 2-Noclip 3-Knockback 4-Warping 5-Backwards

facing = 0;
facing_vento = 0;


cam_x = 0;
cam_y = 0;

hp = 100;
dano_time = 0;
game_over = false;

empurra = 0;
empurra_dir = 0;

ataque_time = 0;
impacto = 0;

curando = false;
tempo_cura = 0;
duracao_cura = 245; // 1 segundo (60 FPS)
animacao_cura_iniciada = false;
imortal = false

dash_vel = 12
dash_dir = 0

dash_carga = 45;
dash_dura = 100;
dash_recarga = 60;

hp_max = 100;
hp_anterior = hp;    // para detectar quando perde vida
hp_fantasma = hp;    // vida "antiga", usada para piscar os segmentos perdidos
bat_pisca = 0;       // timer da animação de dano
bat_segs = 10;       // quantidade de segmentos

if (!instance_exists(obj_cam)) instance_create_layer(280, 272, "Entities", obj_cam);
if (!instance_exists(obj_spellbook)) instance_create_layer(0, 0, "Sistemas", obj_spellbook); 
if (!instance_exists(obj_save))      instance_create_layer(0, 0, "Sistemas", obj_save); 
if (!instance_exists(obj_inventory)) instance_create_layer(0, 0, "Sistemas", obj_inventory);