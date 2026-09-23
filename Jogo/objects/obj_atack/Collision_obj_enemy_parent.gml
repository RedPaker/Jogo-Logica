show_debug_message("DANO: " + string(dano));

if(!atingiu){
	other.hp -= dano;
	
	other.dano_time = 15;
	
	other.empurra = 7;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
	
	
	}
