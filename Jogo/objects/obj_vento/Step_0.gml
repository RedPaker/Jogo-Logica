face = round(obj_plr_rpg.facing/90)*90 +360;
image_angle =  -face+90;




x = obj_plr_rpg.x + lengthdir_x(atk_dist, face);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, face);

time_vento--

if (time_vento <= 0){
    instance_destroy();
    obj_plr_rpg.state = 0
}