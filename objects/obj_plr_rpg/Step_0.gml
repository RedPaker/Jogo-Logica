//uhh ignore o messi code plzz
var _input_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _input_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
var _distnc = 0;
var _temp_x = 0;
var _temp_y = 0;



if (keyboard_check(vk_shift)) {
	move_spdmax =2;
}else {
    move_spdmax = 1;
}

move_spdy = clamp(move_spdy+(_input_y*move_acc),-move_spdmax,move_spdmax);
move_spdx = clamp(move_spdx+(_input_x*move_acc),-move_spdmax,move_spdmax);



if (_input_x == 0) { //fricção
	move_spdx*=.7;
    
}
if (_input_y == 0){ //fricção
    move_spdy*=.7;
}
if (move_spdx <= 0.1 and move_spdx >= -0.1) { // parar de mover quando menor q tal numero
	move_spdx = 0;
}
if (move_spdy <= 0.1 and move_spdy >= -0.1) {
	move_spdy = 0;
}




if (_input_x!=0 or _input_y!=0){
    move_dir = point_direction(0, 0, move_spdx, move_spdy);//essa bomba é pra pega a direção do movimento pro atak
    _distnc = point_distance(0,0,move_spdx,move_spdy);
    if (_distnc > move_spdmax){
        _temp_x=(move_spdx / _distnc)*move_spdmax
        _temp_y=(move_spdy / _distnc)*move_spdmax
        move_and_collide(_temp_x, _temp_y, tilemap_foreground, undefined, undefined, undefined);
    }else {
    	move_and_collide(move_spdx, move_spdy, tilemap_foreground, undefined, undefined, undefined);
    }
}else {
	move_and_collide(move_spdx, move_spdy, tilemap_foreground, undefined, undefined, undefined);
}

