switch (button_id) {
	case 1:
        if(layer_get_visible("InventarioLayer") == false){
            layer_set_visible("InventarioLayer", true);
        }else {
            layer_set_visible("InventarioLayer", false);
        }
        break;
    case 2:
        
        break;
    case 3:
        
        break;
    case 4:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].throwable == true){
            array_delete(global.inventario_itens, button_sub_id, 1);
        }
        
        
        break;
    case 5:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].use != ""){
            switch (global.inventario_itens[button_sub_id].use) {
            	case "eat":
                    if (obj_plr_rpg.hp < obj_plr_rpg.hp_max and findbynome("Spoon") != -1) {
                        obj_plr_rpg.hp = min(obj_plr_rpg.hp+10, obj_plr_rpg.hp_max);
                    	array_delete(global.inventario_itens, button_sub_id, 1);
                    }
                    
            }
        }
        
        break;
    default:
        
        break;
}