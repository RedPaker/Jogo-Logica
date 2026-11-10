switch (button_id) {
    case 4:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].throwable == true){
            visible = true;
        }else {
            visible = false;
        }
        break;
    case 5:
        if(button_sub_id < array_length(global.inventario_itens) and global.inventario_itens[button_sub_id].use != ""){
            visible = true;
            switch (global.inventario_itens[button_sub_id].use) {
                case "eat":
                    if (findbynome("Spoon") != -1) {
                        visible = true;
                    }else {
                    	visible = false;
                    }
                    
            }
        }else {
            visible = false;
        }
        
        break;
    default:
        
        break;
}