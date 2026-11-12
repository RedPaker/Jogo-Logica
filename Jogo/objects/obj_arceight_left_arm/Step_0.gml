switch (estado) {
	case "perseguir":
        sprite_index = spr_Arc_8LHandSpinBig1;
        if (apontando == "right") {
            image_angle -=15;
        }else {
            image_angle +=15;

        }
        break;
    case "atirar":
        sprite_index = spr_Arc_8LHandStop;
        image_angle =0;
        break;
}