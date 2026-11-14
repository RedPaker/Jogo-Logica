other.move_spd = 0


if (pode_tomar){ 
    if(other.object_index == obj_arceight_body){
        if (other.kapows > 0) { 
            var _texto = instance_create_layer(other.x, other.y-12, "instances", "NO EFFECT");
            _texto.dano = dano
        }else {
        	other.hp -= dano;
            var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
            _texto.dano = dano
            other.chocado = true;    
        }
    }else {
        other.hp -= dano;
        other.chocado = true;    
        var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
        _texto.dano = dano
    }
    
    
	other.dano_time = 15;
    }
    