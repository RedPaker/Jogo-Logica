if(place_meeting(x, y, obj_plr_rpg)){
    if(keyboard_check_pressed(ord("E"))){
        var _item_data = {
            name: obj_enemy_parent,
            sprite:spr_plr_placeholder,
        };
        array_push(global.inv, _item_data);
        instance_destroy();
    }
    
}