// Inherit the parent event
event_inherited();
if (keyboard_check_pressed(ord("V"))){
    if (encaixado){
        show_debug_message("Tem bloco")
    } else {
        show_debug_message("Não tem bloco")
    }
}

