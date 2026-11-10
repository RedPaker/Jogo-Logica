// Inherit the parent event
event_inherited();

hp = 250

move_spd = 0.7;
estado = "perseguir";
tempo_estado = 0;
tempo_tiro = 0;

grid_tamanho = 32;

var _colunas = ceil(room_width / grid_tamanho);
var _linhas = ceil(room_height / grid_tamanho);

grid_ia = mp_grid_create(
    0, 0,
    _colunas,
    _linhas,
    grid_tamanho,
    grid_tamanho
);

caminho = path_add();
tempo_recalcular = 0;

framecall = 0;
crnt_frame = 0;
hit = 0;

function sprite_walkv(_h,_v,_si1,_si2,_si3){
    if(_v != 0) sprite_index = _si1;
    else if (_h > 0) sprite_index = _si2;
    else if (_h < 0) sprite_index = _si3;
}

function sprite_walkh(_h,_v,_si1,_si2,_si3){
    if(_h > 0) sprite_index = _si2;
    else if (_h < 0) sprite_index = _si3;
    else if (_v != 0) sprite_index = _si1;
}

instance_create_layer(x,y,"Entities",obj_arceight_head,)