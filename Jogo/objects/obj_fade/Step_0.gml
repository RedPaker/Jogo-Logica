alfa += velocidade_fade * estado;


if (alfa >= 1) {
    alfa = 1;
    estado = -1;
    
    if (sala_destino != noone) {
        if (instance_exists(player)) {
            if (destino_x != -1) player.x = destino_x;
            if (destino_y != -1) player.y = destino_y;
        }
        
        room_goto(sala_destino); 
    }
}


if (alfa <= 0 && estado == -1) {
    instance_destroy();
}