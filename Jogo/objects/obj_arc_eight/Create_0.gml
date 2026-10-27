// Inherit the parent event
event_inherited();

move_spd = 0.4;
estado = "perseguir";
tempo_estado = 0;
tempo_tiro = 0;


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