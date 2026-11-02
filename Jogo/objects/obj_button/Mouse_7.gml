image_index = 1;

switch (button_id) {

    case 1: // Play
        layer_set_visible(layer_get_id("SavesLayer"), true);
        layer_set_visible(layer_get_id("MainLayer"), false);

        switch (button_sub_id) {
            case 1:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("MainLayer"), true);
            break;
        }
    break;

    case 2: // Config
        layer_set_visible(layer_get_id("SettingsLayer"), true);
        layer_set_visible(layer_get_id("MainLayer"), false);

        switch (button_sub_id) {
            case 1:
                layer_set_visible(layer, false);
                layer_set_visible(layer_get_id("MainLayer"), true);
            break;
        }
    break;

    case 3: // Créditos

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

            var _ui_layer = layer_get_id("UILayer_1");
            var _text_element = layer_text_get_id(_ui_layer, "text_5B88EC1D");

            if (_text_element != -1) {
                layer_text_text(_text_element, global.codigo_binario);
            }
        }
    break;
}