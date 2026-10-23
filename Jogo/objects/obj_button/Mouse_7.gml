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
        
    break;
    case 3://creditos
        
    break;
    case 4://exit
        game_end()
    break;
}