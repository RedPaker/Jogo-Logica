var _camx = obj_plr_rpg.cam_x;
var _camy = obj_plr_rpg.cam_y;

var _plrx = obj_plr_rpg.x;
var _plry = obj_plr_rpg.y;


if (obj_plr_rpg.noclip == 1) {
	x = lerp(x, _plrx, .9);
    y = lerp(y, _plry, .9);
}else{
    x = lerp(x, _plrx+(_camx*50), .025); //para mostrar um pouco mais a frente do jogador
    y = lerp(y, _plry+(_camy*50), .025);
}

camera_x = camera_get_view_width(view_camera[0]);
camera_y = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], (x-(camera_x/2)), (y-(camera_y/2)));