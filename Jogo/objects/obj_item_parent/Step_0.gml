if(place_meeting(x, y, obj_plr_rpg)){
    if(keyboard_check_direct(ord("Z"))){
        var _item_data = {
            name: item_name,
            sprite:object_get_sprite(object_index),
        };
        array_push(global.inv, _item_data);
        instance_destroy();
    }
    
}