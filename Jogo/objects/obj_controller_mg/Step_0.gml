
var _liberados = poderes_liberados();
var _qtd = array_length(_liberados);


var _ui_root = layer_get_flexpanel_node("GuiLayer");
var _painel  = flexpanel_node_get_child(_ui_root, "FlexPanel_11");

var _struct    = flexpanel_node_get_struct(_painel);
var _sprite_id = _struct.layerElements[0].elementId;

layer_sprite_speed(_sprite_id, 0);
layer_sprite_index(_sprite_id, 2); 

if (!obj_plr_rpg.coletou_livro) {
    layer_sprite_alpha(_sprite_id, 0); // Invisível (não é renderizada)
} else {
    layer_sprite_alpha(_sprite_id, 1); // Visível
}


if (_qtd == 0) {
    global.meu = 0;
    global.me1 = 0;
    global.me2 = 0;
} else {
    // posicao do poder equipado na lista (se nao estiver, equipa o primeiro)
    var _pos = 0;
    for (var i = 0; i < _qtd; i++) {
        if (_liberados[i] == global.meu) { _pos = i; break; }
    }

    if (keyboard_check_pressed(global.st_smg)) {
        _pos = (_pos + 1) mod _qtd;
        if (_qtd>1) {
        	        audio_play_sound(snd_switch_spell,1,false,1*global.st_soundefects*global.st_master);
        }
    }

    global.meu = _liberados[_pos];
    global.me1 = (_qtd > 1) ? _liberados[(_pos + 1) mod _qtd] : 0;
    global.me2 = (_qtd > 2) ? _liberados[(_pos + 2) mod _qtd] : 0;
}

if (tiro_time > 0) {
    tiro_time--;
}
if(choque_time > 0){
    choque_time --;
}
if(jukebox_time > 0){
    jukebox_time --;
}
if(vento_time > 0){
    vento_time--;
}
if(cura_time > 0){
        cura_time --;
}
if(flash_time > 0){
        flash_time --;
    }

if (overheat_time > 0){
    overheat_time --;
}

if (keyboard_check(global.st_umg) && poder_liberado(global.meu)){
    switch (global.meu) {
        case 1:
            lancar_cd()
        break;
        case 2:
            choque();
        break;
    
        case 3:
            explosao();
        break;
        
        case 4:
            vento();
        break; 
    
        case 5:
            cura();
        break;
        
        case 6:
            flash();
        break;    
    
        case 7:
            overheat();
        break;    
    }
}