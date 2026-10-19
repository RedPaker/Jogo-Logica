show_debug_message("DANO: " + string(dano));

if(!atingiu){
	other.hp -= dano;
    
    var _texto = instance_create_layer(x, y - 12, "Instances", obj_damage_counter);
    
    _texto.dano = 10;
	
	other.dano_time = 40;
	
	other.empurra = 11;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
	
	
	}

