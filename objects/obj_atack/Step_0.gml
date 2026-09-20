tempo_vida--;

image_angle =  obj_plr_rpg.facing;

var distancia = 10

x = obj_plr_rpg.x + lengthdir_x(distancia, obj_plr_rpg.facing);
y = obj_plr_rpg.y + lengthdir_y(distancia, obj_plr_rpg.facing);

if(tempo_vida <=0){
	instance_destroy();
	}