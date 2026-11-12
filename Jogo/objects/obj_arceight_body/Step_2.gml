obj_arceight_head.x = x;
obj_arceight_head.y = y - 25;
apontando = "right";
if (obj_plr_rpg.x > x) {
    apontando = "right";
	switch (estado) {
    	case "perseguir":
                obj_arceight_left_arm.x = x + 12;
                obj_arceight_left_arm.y = y - 10;
                obj_arceight_right_arm.x = x - 12;
                obj_arceight_right_arm.y = y - 10; 
            break;
        case "atirar":
                obj_arceight_left_arm.x = x - 12;
                obj_arceight_left_arm.y = y - 10;
                obj_arceight_right_arm.x = x + 12;
                obj_arceight_right_arm.y = y - 10; 
            break;
    }
}else {
    apontando = "left";
	switch (estado) {
    	case "perseguir":
                obj_arceight_left_arm.x = x - 12;
                obj_arceight_left_arm.y = y - 10;
                obj_arceight_right_arm.x = x + 12;
                obj_arceight_right_arm.y = y - 10; 
            break;
        case "atirar":
                obj_arceight_left_arm.x = x + 12;
                obj_arceight_left_arm.y = y - 10;
                obj_arceight_right_arm.x = x - 12;
                obj_arceight_right_arm.y = y - 10; 
            break;
    }
}


obj_arceight_left_arm.estado = estado;
obj_arceight_left_arm.apontando = apontando;
obj_arceight_right_arm.estado = estado;

if (hit==0) {
	switch (estado) {
	case "perseguir":
        obj_arceight_head.image_index = 1;
    break;
    case "atirar":
        obj_arceight_head.image_index = 2;
    break;
}
}

if (oldhp>hp){
    hit = 30;
    obj_arceight_left_arm.image_index = 0;
    obj_arceight_head.image_index = 0;
}
if(hit>0){
    hit--;
}

depth = -bbox_bottom;
obj_arceight_head.depth = depth;
obj_arceight_left_arm.depth = depth-2;
obj_arceight_right_arm.depth = depth-2;