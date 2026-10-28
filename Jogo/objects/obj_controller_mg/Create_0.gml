id_magia = 1;

tiro_time = 0;
tiro_cadencia = 15;

choque_time = 0;
choque_cadencia = 400;

jukebox_time = 0;
jukebox_cadencia = 500;

vento_time = 0;
vento_cadencia = 150;

cura_time = 0;
cura_cadencia = 400;


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

function explosao(){
    if(jukebox_time > 0){
    jukebox_time --;
}

if (keyboard_check_pressed(global.st_umg) && jukebox_time <= 0){
    instance_create_layer(obj_plr_rpg.x, obj_plr_rpg.y,"Instances",obj_jukebox);
    
    jukebox_time = jukebox_cadencia;
    }
}

function vento(){
    if(vento_time > 0){
    vento_time--;
}

if (keyboard_check_pressed(global.st_umg) && vento_time <= 0){
    var _distancia = 16;
    
    var _ax = x + lengthdir_x(_distancia, obj_plr_rpg.facing);
    var _ay = y + lengthdir_y(_distancia, obj_plr_rpg.facing);
    
    instance_create_layer(_ax, _ay, "instances", obj_vento, {atk_dist:_distancia});
    
    vento_time = vento_cadencia;
}
}

function cura(){
    if(cura_time > 0){
        cura_time --;
    }
    if(keyboard_check_pressed(global.st_umg) && cura_time <= 0){
        obj_plr_rpg.hp = min(obj_plr_rpg.hp + 30, 100);
        cura_time = cura_cadencia;
        show_debug_message("curado");
    }
}