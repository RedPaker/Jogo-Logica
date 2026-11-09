// Inherit the parent event
event_inherited();



if(place_meeting(x, y, obj_plr_rpg)){
  if(keyboard_check_pressed(ord("Z"))){
        obj_plr_rpg.coletou_livro = true
        instance_deactivate_object(id)
    }
}
