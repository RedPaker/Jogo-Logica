// Inherit the parent event
event_inherited();

gerenciar_estrutura(obj_bloco_if_rabo, "qt_if", "blk_if");

if (keyboard_check_pressed(ord("V"))){
    if (encaixado){
        show_debug_message("Tem bloco")
    } else {
        show_debug_message("Não tem bloco")
    }
}


