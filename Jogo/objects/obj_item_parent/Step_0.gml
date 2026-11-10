if (place_meeting(x, y, obj_plr_rpg)) {
    if (keyboard_check_pressed(global.st_use) and array_length(global.inventario_itens) < 12) {
        

        var _item_data = {
            nome: item_name, 
            sprite: sprite_index
        };
        
        array_push(global.inventario_itens, _item_data);
        
        coletado = true;
        instance_destroy(); 
    }
}