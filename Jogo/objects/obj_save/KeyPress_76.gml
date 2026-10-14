
if (file_exists("save.ini")) {
    ini_open("save.ini");
    //Section: Player
    obj_plr_rpg.x = ini_read_real("player", "x", 0);
    obj_plr_rpg.y = ini_read_real("player", "y", 0);
    obj_plr_rpg.hp = ini_read_real("player", "hp", 100); 
    
    //Section: Character
    global.inv = [];
    
    //Section: Progress
    var _json_string = ini_read_string("Progress", "Yellow Thingy", "");
    if (_json_string != "") {
        var _item = json_parse(_json_string);
        
        if(layer_has_instance("Itens", obj_teste) == false){
            instance_create_layer(_item.x, _item.y, "Itens", _item.obj)
        }   	
    }
    
    ini_close();


}
