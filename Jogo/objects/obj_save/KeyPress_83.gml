if(place_meeting(x, y, obj_plr_rpg)){
if(file_exists("save.ini"))file_delete("save.ini"); 
    ini_open("save.ini");

    ini_write_real("player", "x", obj_plr_rpg.x);
    ini_write_real("player", "y", obj_plr_rpg.y);
    ini_write_real("player", "hp", obj_plr_rpg.hp);

 
    ini_close();
}