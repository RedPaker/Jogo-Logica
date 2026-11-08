if (keyboard_check_pressed(global.st_inv)) {
    if (layer_get_visible("MenuLayer") == false) {
        layer_set_visible("MenuLayer",true)
        instance_deactivate_layer("Misc");
        instance_deactivate_layer("Walls");
        instance_deactivate_layer("Itens");
        instance_deactivate_layer("Entities");
    }else {
        layer_set_visible("MenuLayer",false)
        instance_activate_layer("Misc");
        instance_activate_layer("Walls");
        instance_activate_layer("Itens");
        instance_activate_layer("Entities");
    }
}
if (layer_get_visible("MenuLayer") == false && instance_exists(layer_get_id("Entities")) == true) {
    instance_deactivate_layer("Misc");
    instance_deactivate_layer("Walls");
    instance_deactivate_layer("Itens");
    instance_deactivate_layer("Entities");
}else if (layer_get_visible("MenuLayer") == true && instance_exists(layer_get_id("Entities")) == false){
    instance_activate_layer("Misc");
    instance_activate_layer("Walls");
    instance_activate_layer("Itens");
    instance_activate_layer("Entities");
}
