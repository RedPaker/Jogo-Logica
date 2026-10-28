obj_arceight_head.x = x;
obj_arceight_head.y = y - 26;
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
    obj_arceight_head.image_index = 0
}
if(hit>0){
    hit--;
}
