if (keyboard_check_pressed(ord("Q"))) {
    id_magia ++;
    if(id_magia > 6){
        id_magia = 1;
    }
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