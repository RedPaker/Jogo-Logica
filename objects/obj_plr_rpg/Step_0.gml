var _y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _x = keyboard_check(ord("D"))-keyboard_check(ord("A"));

if (keyboard_check(vk_shift)) {
	move_spdy = clamp(move_spdy+(_y*move_acc),-2,2);
    move_spdx = clamp(move_spdx+(_x*move_acc),-3,3);
}else {
	move_spdy = clamp(move_spdy+(_y*move_acc),-1,1);
    move_spdx = clamp(move_spdx+(_x*move_acc),-2,2);
}

move_and_collide(move_spdx, move_spdy, tilemap, undefined, undefined, undefined);
move_spdx*=0.7
move_spdy*=0.7