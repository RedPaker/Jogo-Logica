// Conta o tempo da música
if (music_time > 0) {
    music_time--;
}

// Verifica se os inimigos chegaram perto
with (obj_enemy_parent) {

    if (apaixonado) {
        var _dist = point_distance(x, y, other.x, other.y);

        if (_dist <= other.raio_parada) {
            stunned = true;
        }
        else {
            stunned = false;
        }
    }
}

// Quando a música termina
if (music_time <= 0 && !explodiu) {
    explodiu = true;

    // Libera todos os inimigos
    with (obj_enemy_parent) {
        apaixonado = false;
        stunned = false;
    }

    // Cria a explosão que causa dano
    instance_create_layer(x, y, "Entities", obj_explosion_jk);

    instance_destroy();
}