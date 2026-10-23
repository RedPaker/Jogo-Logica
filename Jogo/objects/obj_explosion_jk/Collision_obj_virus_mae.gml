

if(!atingiu){
	other.hp -= dano;
    
    var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
    
    _texto.dano = dano
    
	other.dano_time = 15;
	
	other.empurra = 20;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
    
	}