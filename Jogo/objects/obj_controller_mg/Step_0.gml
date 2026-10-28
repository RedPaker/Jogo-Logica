if (keyboard_check_pressed(ord("1"))) {
    id_magia = 1;
}

if (keyboard_check_pressed(ord("2"))) {
    id_magia = 2;
}

if (keyboard_check_pressed(ord("3"))) {
    id_magia = 3;
}

if (keyboard_check_pressed(ord("4"))) {
    id_magia = 4;
}

if (keyboard_check_pressed(ord("5"))) {
    id_magia = 5;
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
    }
}