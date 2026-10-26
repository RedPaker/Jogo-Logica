other.move_spd = 0    

if (pode_tomar){ 
        other.hp -= dano;
    
        var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
    
    _texto.dano = dano;
    
	other.dano_time = 15;
    }
    