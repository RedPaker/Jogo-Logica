// --- Roda de feiticos: so mostra e so troca entre os poderes ja liberados ---
// global.meu = poder equipado | me1 e me2 = proximos da roda | 0 = vazio
var _liberados = poderes_liberados();
var _qtd = array_length(_liberados);

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