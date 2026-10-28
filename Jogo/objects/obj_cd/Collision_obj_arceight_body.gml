show_debug_message("DANO: " + string(dano));

if(!atingiu){
	other.hp -= dano;
    
    var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
    
    _texto.dano = dano
    
	other.dano_time = 15;
	
	atingiu = true;
	
    instance_destroy()
	
	}