obj_arceight_head.x = x;
obj_arceight_head.y = y - 26;
switch (estado) {
	case "perseguir":
        obj_arceight_head.image_index = 0
    break;
    case "atirar":
        obj_arceight_head.image_index = 2
    break;
}
if (empurra>0){
    obj_arceight_head.image_index = 1
}
