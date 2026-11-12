passos = [];
ao_terminar = undefined;
idx = -1;
estado = 0;            
passo = undefined;

spr = noone;
frame = 0;
anim_fps = 0;

fade_a = 1;             
fade_alvo = 0;
fade_vel = 0.03;

flash_a = 0;

shake_t = 0;
shake_dur = 1;
shake_mag = 0;

zoom = 1;
zoom_alvo = 1;

msgs = undefined;
dialogo_iniciado = false;
espera = 0;
aguardando_tecla = false; 
musica = noone;

tecla_pular = vk_escape;

opt = function(_s, _k, _d) {
    return variable_struct_exists(_s, _k) ? _s[$ _k] : _d;
}

global.cutscene_ativa = true;
global.jogo_pausado = true;
instance_deactivate_layer("Entities");
instance_deactivate_layer("Itens");
instance_deactivate_layer("Misc");
