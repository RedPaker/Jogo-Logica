face = round(obj_plr_rpg.facing/90)*90

image_angle = face+90




x = obj_plr_rpg.x + lengthdir_x(atk_dist, face);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, face);

/*var _dx = lengthdir_x(atk_dist, obj_plr_rpg.facing);
var _dy = lengthdir_y(atk_dist, obj_plr_rpg.facing);

if (abs(_dx)<abs(_dy)){
    x = obj_plr_rpg.x;
    y = obj_plr_rpg.y + _dy;
}else {
    x = obj_plr_rpg.x + _dx;
    y = obj_plr_rpg.y;
}*/

tempo_vida--;

if(tempo_vida <=0){
	instance_destroy();
	}