


if(file_exists("save.ini"))file_delete("save.ini"); 
    ini_open("save.ini");
    //Section: Player
    ini_write_real("player", "x", obj_plr_rpg.x);
    ini_write_real("player", "y", obj_plr_rpg.y);
    ini_write_real("player", "hp", obj_plr_rpg.hp);

    //Section: Character
    ini_write_real("character", "quantidade", array_length(global.inv))

    //Section: Progress
    var _item = {
        obj: obj_teste,
        x: obj_teste.x,
        y: obj_teste.y
    }
    var _json_string = json_stringify(_item)
    ini_write_string("Progress", "Yellow Thingy", _json_string);
ini_close();