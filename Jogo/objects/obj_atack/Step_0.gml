//depth = -y

image_angle =  obj_plr_rpg.facing+90;


x = obj_plr_rpg.x + lengthdir_x(atk_dist, obj_plr_rpg.facing);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, obj_plr_rpg.facing);

tempo_vida--;

if(tempo_vida <=0){
	instance_destroy();
	}