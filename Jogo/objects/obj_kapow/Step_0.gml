switch (state) {
	case "flicker":
        sprite_index = spr_kapowflick;
        break;
    case "explode":
        if (sprite_index == spr_kapowflick) {
        	sprite_index = spr_kapowxplod;
            if (layer_exists("ShakeEffect")) {
            	layer_set_visible("ShakeEffect", true);
            }
            if (instance_exists(obj_arceight_body)) {
                if (obj_arceight_body.kapows >1) {
                    obj_arceight_body.kapows--;
                }else {
                	obj_arceight_body.hp = min(obj_arceight_body.hp-10,0);
                }
            }
        }
        break;
}