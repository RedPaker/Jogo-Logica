

switch (button_id) {
	case 5:
        fileexistsload = sv_check(button_sub_id);
        
        call_later(1, time_source_units_frames, function() {
            var _dynamic_text_name = "text_save_action" + string(button_sub_id);
            var _text_element = layer_text_get_id(layer, _dynamic_text_name);
            
            if (_text_element != -1) {
                if (fileexistsload == true) {
                    layer_text_text(_text_element, "Load");
                } else {
                    layer_text_text(_text_element, "New Game");
                }
            }
        }); 
    break;
    case 6:
        fileexistsdel = sv_check(button_sub_id);
        state = 0; //0 - default; 1 - confirm; 2 - no save file 
        sprite_index = spr_ui_btao_trash;
    break;
}