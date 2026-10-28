oldhp = hp



switch (estado) {

    case "perseguir":  
        if (instance_exists(obj_plr_rpg)) {
            alvo_x = obj_plr_rpg.x;
            alvo_y = obj_plr_rpg.y; 
        }
        var _dir = point_direction(0, 0, alvo_x-x, alvo_y-y);
        //var _hor = lengthdir_x(1, _dir);
        //var _ver = lengthdir_y(1, _dir);
        var _hor = clamp(alvo_x - x, -1, 1);
        var _ver = clamp(alvo_y - y, -1, 1);
        
        
        if (abs(_ver)<.2) {
            move_and_collide(_hor * move_spd,0, [tilemap_foreground, obj_enemy_parent] ); 
        }else {
        	move_and_collide(0, _ver * move_spd*1.25, [tilemap_foreground, obj_enemy_parent] ); 
        }
        
        
    if (empurra > 0) {
            var _empurra_x = lengthdir_x(empurra, empurra_dir);
            var _empurra_y = lengthdir_y(empurra, empurra_dir);
            move_and_collide(_empurra_x, _empurra_y, [tilemap_foreground] );
            empurra *= 0.8;
        if (empurra < 0.2) { 
            empurra = 0;
        }
    }
        tempo_estado--; 
    if (tempo_estado <= 0) {
        estado = "atirar";
        tempo_estado = 100;
        tempo_tiro = 1;
        }
    if(_hor != 0 or _ver != 0){
        image_speed = 10;
        if(hp>25){
            if (abs(_hor)>abs(_ver)) {
            	sprite_walkh(_hor,_ver,spr_Arc_8BodyFwBw,spr_Arc_8BodyRight,spr_Arc_8BodyRight);
            }else{
                sprite_walkv(_hor,_ver,spr_Arc_8BodyFwBw,spr_Arc_8BodyRight,spr_Arc_8BodyRight);
            }
        }else {
        	if (abs(_hor)>abs(_ver)) {
            	sprite_walkh(_hor,_ver,spr_Arc_8BrokenFwBw,spr_Arc_8BrokenRight,spr_Arc_8BrokenRight);
            }else{
                sprite_walkv(_hor,_ver,spr_Arc_8BrokenFwBw,spr_Arc_8BrokenRight,spr_Arc_8BrokenRight);
            }
        }
        facing = point_direction(0, 0, _hor, _ver);
    }
    else{
        image_speed = 0;
    }
    break;
    case "atirar":
        tempo_tiro--;
        if (tempo_tiro <= 0) {
            instance_create_layer(x, y, "instances", obj_tiro_boss);
            tempo_tiro = 20; 
        }
        image_speed = 0;
        tempo_estado--;
        if (tempo_estado <= 0) {
            estado = "perseguir";
            tempo_estado = 400;
        }
    break;
}

if (dano_time > 0) {
    dano_time--;

    if ((dano_time div 4) mod 2 == 0) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }
} else {
    image_blend = c_white;
}
if (hp <= 0) {
    audio_play_sound_at(snd_death_arc8,x,y,0,64,128,1,false,1);
    instance_destroy();
}