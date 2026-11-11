function sv_save(save_id){
    var _dados = {
        plr :{
            chapter: global.chapter,
            quests:1
        },
        char : {
            x: obj_plr_rpg.x,
            y: obj_plr_rpg.y,
            hp: obj_plr_rpg.hp,
            face: obj_plr_rpg.facing,
            room: room,
            unlocked_book: obj_plr_rpg.coletou_livro,
            paginas: global.inv,
            inventario: global.inventario_itens,
            spells: obj_controller_mg.unlocked_spells,
        }
    };
    
    var _json = json_stringify(_dados);
    
    var _arquivo = file_text_open_write(string_concat("save", save_id, ".json"));
    file_text_write_string(_arquivo, _json);
    file_text_close(_arquivo);
    
}

function sv_check(save_id){
    if(file_exists(string_concat("save", save_id, ".json"))){
        return true;
    }else {
    	return false;
    }
}

function sv_load(save_id) {
    var _filename = "save" + string(save_id) + ".json";
    
    if (!file_exists(_filename)) {
        show_debug_message("Save file not found!");
        return false;
    }
    
    var _arquivo = file_text_open_read(_filename);
    var _json = file_text_read_string(_arquivo);
    file_text_close(_arquivo);
    
    var _dados = json_parse(_json);

    global.chapter = _dados.plr.chapter;
    global.inv = _dados.char.paginas;
    global.inventario_itens = _dados.char.inventario;
    
    var _mainmenu = ["MainLayer", "SavesLayer", "SettingsLayer"]; 
    for(var i = 0; i < array_length(_mainmenu); i++){ 
        var _layer_id = layer_get_id(_mainmenu[i]);
        if (_layer_id != -1) {
            layer_set_visible(_layer_id, false); 
        }
    }
    
    if (room != _dados.char.room) {
        room_goto(_dados.char.room);
    }
    
    instance_create_depth(0,0,0,obj_saveloader,_dados)

    
    
    
    
    
    return true;
}

function sv_delete(save_id){
    var _savename = string_concat("save", save_id, ".json")
    if (file_exists((_savename))) {
        file_delete(_savename)
        return true;
    }else {
    	return false;
    }
}

function sv_newgame(){
    var _mainmenu = ["MainLayer", "SavesLayer", "SettingsLayer"]; 
    for(var i = 0; i < array_length(_mainmenu); i++){ 
        var _layer_id = layer_get_id(_mainmenu[i]);
        if (_layer_id != -1) {
            layer_set_visible(_layer_id, false); 
        }
    }
    if (instance_exists(obj_plr_rpg))  instance_destroy(obj_plr_rpg);
    if (instance_exists(obj_cam))      instance_destroy(obj_cam);
    if (instance_exists(obj_spellbook)) instance_destroy(obj_spellbook);
    if (instance_exists(obj_menu))      instance_destroy(obj_menu);
    if (instance_exists(obj_controller_mg)) instance_destroy(obj_controller_mg); // poderes bloqueados de novo
    if (instance_exists(old_obj_inventory)) instance_destroy(old_obj_inventory);
    global.inv = []; 
    global.inventario_itens = []; 
    global.chapter = 1;
    scr_fade(rm_casa,-1,-1);
    
}