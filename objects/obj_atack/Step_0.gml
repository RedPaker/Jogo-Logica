

//image_angle =  obj_plr_rpg.facing;


x = obj_plr_rpg.x + lengthdir_x(atk_dist, atk_face);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, atk_face);

tempo_vida--;

if(tempo_vida <=0){
	instance_destroy();
	}