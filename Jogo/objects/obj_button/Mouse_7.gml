image_index = 1
switch (button_id) {
	case 1://play
        layer_set_visible(layer_get_id("SavesLayer"), true);
        layer_set_visible(layer_get_id("MainLayer"), false);
        switch (button_sub_id) {
        	case 1:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("MainLayer"), true);
            break;
        }
    break;
    case 2://config
        layer_set_visible(layer_get_id("SettingsLayer"), true);
        layer_set_visible(layer_get_id("MainLayer"), false);
        switch (button_sub_id) {
        	case 1:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("MainLayer"), true);
            break;
        }
    break;
    case 3://creditos
        
    break;
    case 4://exit
        game_end()
    break;
    case 5://Load/Newgame
        if (fileexistsload == true){
            
        }else {
        	sv_newgame();
        }
    break;
    case 6://Delete
        if (fileexistsdel == true){
            if (state == 0){
                state = 1;
                image_index = 3;
            }else if (state == 1) {
            	state = 0;
                sv_delete(button_sub_id)
                image_index = 1
            }
        }else{
        	state = 2;
            image_index = 4
        }
    break;
}