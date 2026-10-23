if (instance_exists((obj_plr_rpg))){
    x = obj_plr_rpg.x
    y = obj_plr_rpg.y
    
    camera_x = camera_get_view_width(view_camera[0]);
    camera_y = camera_get_view_height(view_camera[0]);
    camera_set_view_pos(view_camera[0], (x-(camera_x/2)), (y-(camera_y/2)));
}