//uhh ignore o messi code plzz
var _input_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _input_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
/*var _distnc = 0;
var _temp_x = 0;
var _temp_y = 0;*/



if (keyboard_check(vk_shift)) {
	move_spd = 3;
}else {
    move_spd = 2;
}

move_spdy = _input_y*move_spd;
move_spdx = _input_x*move_spd;



if(_input_x!=0 or _input_y!=0){
    _distnc = point_distance(0,0,move_spdx,move_spdy);
    if (_distnc > move_spd){
        _temp_x=(move_spdx / _distnc)*move_spd;
        _temp_y=(move_spdy / _distnc)*move_spd;
        move_and_collide(_temp_x, _temp_y, tilemap_foreground, undefined, undefined, undefined);
    }else {
    	move_and_collide(move_spdx, move_spdy, tilemap_foreground, undefined, undefined, undefined);
    }
}else {
	move_and_collide(move_spdx, move_spdy, tilemap_foreground, undefined, undefined, undefined);
}

//move_and_collide(move_spdx, move_spdy, tilemap_foreground, undefined, undefined, undefined);