id_magia = 2;

tiro_time = 0;
tiro_cadencia = 30;

choque_time = 0;
choque_cadencia = 400;



function lancar_cd(){
    if (tiro_time > 0) {
    tiro_time--;
    }
    if (keyboard_check(global.st_umg) && tiro_time <= 0) {
    var _tiro = instance_create_layer(
        obj_plr_rpg.x + lengthdir_x(14, obj_plr_rpg.facing),
        obj_plr_rpg.y + lengthdir_y(14, obj_plr_rpg.facing),
        "instances",
        obj_cd
    );

    _tiro.direcao = obj_plr_rpg.facing;
    _tiro.image_angle = obj_plr_rpg.facing;

    tiro_time = tiro_cadencia;
}
}

function choque(){
    if(choque_time > 0){
    choque_time --;
    }
    if (keyboard_check_pressed(global.st_umg) && choque_time <= 0){
    instance_create_layer(obj_plr_rpg.x,obj_plr_rpg.y,"Instances",obj_choque)
    choque_time = choque_cadencia;
    }
}