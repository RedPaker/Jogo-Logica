if (instance_exists(obj_dialogo)) exit;
    
if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < 8){
    can_talk = true;
    if (keyboard_check_pressed(input_key)){
         create_dialog(dialog);
    }
} else {
	can_talk = false;
}