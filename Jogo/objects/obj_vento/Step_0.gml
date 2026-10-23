image_angle =  obj_plr_rpg.facing_vento-90;

x = obj_plr_rpg.x + lengthdir_x(atk_dist, obj_plr_rpg.facing_vento);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, obj_plr_rpg.facing_vento);

time_vento--

if (time_vento <= 0){
    instance_destroy();
}