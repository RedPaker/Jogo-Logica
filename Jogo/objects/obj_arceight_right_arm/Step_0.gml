if (estado == "atirar") {
	image_angle = point_direction(x,y,obj_plr_rpg.x,obj_plr_rpg.y)+90;
    tempo_tiro--;
    
    if (tempo_tiro <= 0) {
        if (instance_exists(obj_plr_rpg)) {
            var _tiro = instance_create_layer(x, y, "Entities", obj_tiro_boss);
            _tiro.direction = point_direction(x, y, obj_plr_rpg.x, obj_plr_rpg.y);
        }

        tempo_tiro = 20;
    }
}else {
	image_angle = 0;
}