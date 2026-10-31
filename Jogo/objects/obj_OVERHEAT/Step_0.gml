
if (lifetime > 0){
    x = obj_plr_rpg.x;
    y = obj_plr_rpg.y;
    obj_plr_rpg.empurra = 0
    obj_plr_rpg.imortal = true
    obj_plr_rpg.state = 6
    obj_controller_mg.id_magia = -1
    lifetime--
}

if (lifetime <= 0){
    instance_destroy()
    obj_plr_rpg.imortal = false
    obj_plr_rpg.state = 0
    obj_controller_mg.id_magia = 7
}





