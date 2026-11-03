// Inherit the parent event
event_inherited();
event_inherited();

if (dialog_id == 0) {
    dialog = d_select_dialog("welcome_dialog");
}
else if (dialog_id == 1) {
    dialog = d_select_dialog("tutorial_binario_dialog");
}

