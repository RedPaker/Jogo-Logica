image_index = 1;

switch (button_id) {

    case 1: // Change Menus
        switch (button_sub_id) {
            case 1:
                layer_set_visible(layer_get_id("SavesLayer"), true);
                layer_set_visible(layer_get_id("MainLayer"), false);
            break;
            case 2:
                layer_set_visible(layer_get_id("SettingsLayer"), true);
                layer_set_visible(layer_get_id("MainLayer"), false);
            break;
            case 3:
                layer_set_visible(layer_get_id("SavesLayer"), true);
                layer_set_visible(layer_get_id("MainLayer"), false);
            break;
            default:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("MainLayer"), true);
            break;
        }
    break;

    case 2:// Change Setting Category
        switch (button_sub_id) {
            case 1:
                layer_set_visible(layer_get_id("GameplayLayer"), true);
                layer_set_visible(layer_get_id("SettingsLayer"), false);
            break; 
            case 2:
                layer_set_visible(layer_get_id("VisualLayer"), true);
                layer_set_visible(layer_get_id("SettingsLayer"), false);
            break;
            case 3:
                layer_set_visible(layer_get_id("AudioLayer"), true);
                layer_set_visible(layer_get_id("SettingsLayer"), false);
            break;
            case 4:
                layer_set_visible(layer_get_id("ResinaLayer"), true);
                layer_set_visible(layer_get_id("SettingsLayer"), false);
            break;
            default:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("SettingsLayer"), true);
            break;
        }
    break;

    case 3:

    break;

    case 4: // Exit
        game_end();
    break;

    case 5: // Load/New Game
        if (fileexistsload == true) {

        } else {
            sv_newgame();
        }
    break;

    case 6: // Delete
        if (fileexistsdel == true) {
            if (state == 0) {
                state = 1;
                image_index = 3;
            } 
            else if (state == 1) {
                state = 0;
                sv_delete(button_sub_id);
                image_index = 1;
            }
        } 
        else {
            state = 2;
            image_index = 4;
        }
    break;

    case 7: // Botão 1
    case 8: // Botão 0
        if (string_length(global.codigo_binario) < 8) {
            global.codigo_binario += string(8 - button_id);

            var _ui_layer = layer_get_id("BinarioLayer");
            var _text_element = layer_text_get_id(_ui_layer, "text_5B88EC1D");

            if (_text_element != -1) {
                layer_text_text(_text_element, global.codigo_binario);
            }
        }
    break;
    case 9:
    case 10:
    case 11:
    case 12:

    var _botao = button_id - 8;
    var _layer = layer_get_id("RamLayer");

    if (_layer != -1 && layer_get_visible(_layer)) {

        if (_botao == global.numero_puzzle) {

            global.puzzle_acertos++;

            if (global.puzzle_acertos >= 10) {
                layer_set_visible(_layer, false);

                var _puzzle = instance_find(obj_puzzle_ram, 0);

                if (_puzzle != noone) {
                    _puzzle.interagindo = false;
                }
    
                var _anterior = global.numero_puzzle;
                var _novo = irandom_range(1, 3);
    
                if (_novo >= _anterior) {
                    _novo++;
                }
    
                global.numero_puzzle = _novo;
    
                var _texto = layer_text_get_id(_layer, "text_4B58F36B");
    
                if (_texto != -1) {
                    layer_text_text(_texto, string(global.numero_puzzle));
                }
    
                var _puzzle = instance_find(obj_puzzle_ram, 0);
    
                if (_puzzle != noone) {
                    _puzzle.tempo_puzzle = room_speed * 2;
                }
    
            } else {
                global.puzzle_acertos = 0;
            }

            var _anterior = global.numero_puzzle;
            var _novo = irandom_range(1, 3);

            if (_novo >= _anterior) {
                _novo++;
            }

            global.numero_puzzle = _novo;

            var _texto = layer_text_get_id(_layer, "text_4B58F36B");

            if (_texto != -1) {
                layer_text_text(_texto, string(global.numero_puzzle));
            }

            var _puzzle = instance_find(obj_puzzle_ram, 0);

            if (_puzzle != noone) {
                _puzzle.tempo_puzzle = game_get_speed(gamespeed_fps) * 2;
            }

        } else {
            global.puzzle_acertos = 0;
        }
    
    break;
}