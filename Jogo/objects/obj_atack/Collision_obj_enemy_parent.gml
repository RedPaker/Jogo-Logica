show_debug_message("DANO: " + string(dano));

if(!atingiu and other.object_index != obj_enemy_mouth and other.object_index != obj_enemy_atirador){
    if(other.object_index == obj_arceight_body){
        if (other.kapows > 0) { 
            var _texto = instance_create_layer(other.x, other.y-12, "instances", "NO EFFECT");
            _texto.dano = dano
        }else {
        	other.hp -= dano;
            var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
            _texto.dano = dano
            other.dano_time = 15;
        }
    }else {
        other.hp -= dano;
        var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
        _texto.dano = dano
        other.dano_time = 15;
    }
    

	
	other.empurra = 7;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
	
	
	}

