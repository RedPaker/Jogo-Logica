switch (estado) {
	case "perseguir":
        if (obj_arceight_body.kapows > 0) {
        	sprite_index = spr_Arc_8LHandSpinBig1;
            if (apontando == "right") {
                image_angle -=15;
            }else {
                image_angle +=15;
    
            }
        }else {
        	sprite_index = spr_Arc_8LHandSpin;
            if (apontando == "right") {
                image_angle -=5;
            }else {
                image_angle +=5;
    
            }
        }
        
        break;
    case "atirar":
        sprite_index = spr_Arc_8LHandStop;
        image_angle =0;
        break;
}