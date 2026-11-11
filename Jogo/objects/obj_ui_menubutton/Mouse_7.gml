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
        sv_save(global.current_save);
        game_restart();
        break;
    case 4:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].throwable == true){
            instance_create_layer(obj_plr_rpg.x,obj_plr_rpg.y,"Itens",global.inventario_itens[button_sub_id].obj)
            array_delete(global.inventario_itens, button_sub_id, 1);
        }
        
        
        break;
    case 5:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].use != ""){
            switch (global.inventario_itens[button_sub_id].use) {
            	case "eat":
                    if (obj_plr_rpg.hp < obj_plr_rpg.hp_max and findbynome("Spoon") != -1) {
                        obj_plr_rpg.hp = min(obj_plr_rpg.hp+global.inventario_itens[button_sub_id].n, obj_plr_rpg.hp_max);
                    	array_delete(global.inventario_itens, button_sub_id, 1);
                    }
                    
            }
        }
        
        break;
    case 6:
        if (button_sub_id < array_length(global.inventario_itens)) {
            var _info_texto = global.inventario_itens[button_sub_id].info;
            

            if (!instance_exists(caixa_texto_inst)) {
                caixa_texto_inst = instance_create_layer(mouse_x, mouse_y - 20, layer, obj_caixa_texto);
                caixa_texto_inst.texto = _info_texto;
            }
        }
        break;
    default:
        
        break;
}