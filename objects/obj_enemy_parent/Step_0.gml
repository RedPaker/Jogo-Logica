var _hor = clamp(alvo_x - x, -2, 1);
var _ver = clamp(alvo_y - y, -2, 1);

move_and_collide(_hor * move_spd, _ver * move_spd, [tilemap_foreground, obj_enemy_parent]);

if (empurra > 0) {
    var _empurra_x = lengthdir_x(empurra, empurra_dir);
    var _empurra_y = lengthdir_y(empurra, empurra_dir);

    move_and_collide(_empurra_x,_empurra_y,[tilemap_foreground, obj_enemy_parent]);

    empurra *= 0.8;

    if (empurra < 0.2) {
        empurra = 0;
    }
}

if (dano_time > 0) {
    dano_time--;
    image_blend = c_red;
}
else {
    image_blend = c_white;
}

if(hp <= 0){
	instance_destroy();
	}