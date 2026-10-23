

switch (button_id) {
	case 5:
        fileexists = sv_check(button_sub_id);
        
        call_later(1, time_source_units_frames, function() {
            var _dynamic_text_name = "text_save_action" + string(button_sub_id);
            var _text_element = layer_text_get_id(layer, _dynamic_text_name);
            
            if (_text_element != -1) {
                if (fileexists) {
                    layer_text_text(_text_element, "Load");
                } else {
                    layer_text_text(_text_element, "New");
                }
            }
        });
        

        
        
        /*if (fileexists == 1){
            layer_text_text(_textelementid, "test");
        }else {
        	layer_text_text(_textelementid, "test");
        } */
        
        
    break;
}