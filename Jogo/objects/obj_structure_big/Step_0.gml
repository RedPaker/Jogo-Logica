if (instance_exists(obj_plr_rpg)) {
    var alpha_minimo = 0.3;
    
    var limite_esquerdo = x - sprite_xoffset;
    var limite_direito = limite_esquerdo + sprite_width;
    var limite_topo = y - sprite_yoffset;
    var limite_base = y-16; 
    
    var jogador_atras = point_in_rectangle(obj_plr_rpg.x, obj_plr_rpg.y, limite_esquerdo, limite_topo, limite_direito, limite_base);
    
    if (jogador_atras) {
        image_alpha = lerp(image_alpha, alpha_minimo, 0.1);
    } else {
        image_alpha = lerp(image_alpha, 1, 0.1);
    }
}