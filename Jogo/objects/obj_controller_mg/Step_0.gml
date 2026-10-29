if (keyboard_check_pressed(global.st_smg)) {
    id_magia ++;
    if(id_magia > 6){
        id_magia = 1;
    }
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

if (keyboard_check(global.st_umg)){
    switch (id_magia) {
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
    }
}