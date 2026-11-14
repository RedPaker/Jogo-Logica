switch (state) {
	case "flicker":
        sprite_index = spr_kapowflick;
        break;
    case "explode":
        sprite_index = spr_kapowxplod;
        if (layer_exists("ShakeEffect")) {
        	layer_set_visible("ShakeEffect", true);
        }
        break;
}