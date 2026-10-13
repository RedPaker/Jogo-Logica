if(file_exists("save.ini")){
    ini_open("save.ini");

    obj_plr_rpg.x = ini_read_real("player", "x", 0);
    obj_plr_rpg.y = ini_read_real("player", "y", 0);
    obj_plr_rpg.hp = ini_read_real("player", "hp", 100); 
    
    ini_close();
}