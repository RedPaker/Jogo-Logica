// 1. Contagem do tempo da música
if (music_time > 0) {
    music_time--;
}

// 2. Quando o tempo acaba, explode e cria o objeto de explosão UMA ÚNICA VEZ
if (music_time <= 0 && !explodiu) {
    explodiu = true;
    
    // Cria a explosão exatamente na posição da jukebox
    instance_create_layer(x, y, "Instances", obj_explosion_jk);
    instance_destroy()
}