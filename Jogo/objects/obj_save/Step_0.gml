if (keyboard_check_pressed(global.st_inv)) {
    global.menu_aberto = !global.menu_aberto; 
    
    if (global.menu_aberto == true) {
        // Pausa o jogo
        layer_set_visible("MenuLayer", true);
        instance_deactivate_layer("Entities");
        instance_deactivate_layer("Itens");
        instance_deactivate_layer("Misc");
    } else {
        // Despausa o jogo
        layer_set_visible("MenuLayer", false);
        instance_activate_layer("Entities");
        instance_activate_layer("Itens");
        instance_activate_layer("Misc");
    }
}