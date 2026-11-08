

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
    case 7:
    var _text_element = layer_text_get_id(layer, "UI Folder");

    show_debug_message(_text_element);

    if (_text_element != -1) {
        layer_text_text(_text_element, "1");
    }
break;
    case 8:
          var _text_element = layer_text_get_id(layer, "UI Folder");
  
          if (_text_element != -1) {
              layer_text_text(_text_element, "0");
          }
    break;
}

global.codigo_binario = "";

interagindo = false;
distancia_interacao = 32;
tempo_puzzle = 0;

if (!variable_global_exists("puzzle_ram_concluido")) {
    global.puzzle_ram_concluido = false;
}

global.puzzle_acertos = 0;

function atualizar_visor() {
    var _ui_layer = layer_get_id("BinarioPuzzle");
    var _text_element = layer_text_get_id(_ui_layer, "text_4B58F36B");

    if (_text_element != -1) {
        layer_text_text(_text_element, string(global.numero_puzzle));
    }
}