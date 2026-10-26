
if (lifetime > 0){
    x = obj_plr_rpg.x;
    y = obj_plr_rpg.y;
    lifetime--
}

if (lifetime <= 0){
    instance_destroy()
}

if (quantos_choques > 0){
    quantos_choques --
} 

if (quantos_choques <= 0){
    pode_tomar = true;
    quantos_choques = 10
} else {
    pode_tomar = false
}



