if (state == "explode") {
    layer_set_visible("ShakeEffect", false);
    if (instance_exists(obj_arceight_body)) {
    	obj_arceight_body.kapows--;
    }
	instance_destroy();
}