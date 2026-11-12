obj_arceight_head.x = x;
obj_arceight_head.y = y - 26;
obj_arceight_left_arm.x = x - 14;
obj_arceight_left_arm.y = y - 11;
obj_arceight_right_arm.x = x + 14
obj_arceight_right_arm.y = y - 11 

if (hit==0) {
	switch (estado) {
	case "perseguir":
        obj_arceight_head.image_index = 1
    break;
    case "atirar":
        obj_arceight_head.image_index = 2
    break;
}
}

if (oldhp>hp){
    hit = 30;
    obj_arceight_left_arm.image_index = 0;
    obj_arceight_head.image_index = 0
}
if(hit>0){
    hit--;
}

depth = -bbox_bottom;
obj_arceight_head.depth = depth;
obj_arceight_left_arm.depth = depth;