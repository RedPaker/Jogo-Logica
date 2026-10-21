switch (estado) {

    case "perseguir":  
        if (instance_exists(obj_plr_rpg)) {
            alvo_x = obj_plr_rpg.x;
            alvo_y = obj_plr_rpg.y; 
        }
        var _hor = clamp(alvo_x - x, -1, 1);
        var _ver = clamp(alvo_y - y, -1, 1);
        move_and_collide(_hor * move_spd, _ver * move_spd, [tilemap_foreground, obj_enemy_parent] ); 
    if (empurra > 0) {
            var _empurra_x = lengthdir_x(empurra, empurra_dir);
            var _empurra_y = lengthdir_y(empurra, empurra_dir);
            move_and_collide(_empurra_x, _empurra_y, [tilemap_foreground] );
            empurra *= 0.8;
        if (empurra < 0.2) { 
            empurra = 0;
        }
    }
        tempo_estado--; 
    if (tempo_estado <= 0) {
        estado = "filhos";
        tempo_parir = 60;
        }
    break;
    case "filhos":
        tempo_parir--;
    if (tempo_parir <= 0) {
        var _quantidade = instance_number(obj_enimy_rpg);
        
        for(var i = 0; i < filhos; i++){
            if(_quantidade < filhos_max){
                var _ang = irandom(359);
                var _dist = irandom_range(24, 40);
                
                var _ex = x + lengthdir_x(_dist, _ang);
                var _ey = y + lengthdir_y(_dist, _ang);
                
                instance_create_layer(_ex, _ey, "instances", obj_enimy_rpg);
                
                _quantidade++;
            }
        }
        estado = "perseguir";
        tempo_estado = 180;
    }
    break;
}

if (dano_time > 0) {
    dano_time--;

    if ((dano_time div 4) mod 2 == 0) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }
} else {
    image_blend = c_white;
}
if (hp <= 0) {
    instance_destroy();
}