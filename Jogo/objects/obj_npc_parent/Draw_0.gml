draw_self();

if (can_talk && !instance_exists(obj_dialogo)){
    draw_sprite(spr_balao_fala, 0, x , y - 16);
}