if (instance_exists(obj_plr_rpg) && obj_plr_rpg.imortal = false) {
    obj_plr_rpg.hp -= dano;
    show_debug_message("tiro acertado")
}

instance_destroy();