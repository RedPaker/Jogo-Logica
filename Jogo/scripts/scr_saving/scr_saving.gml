function sv_save(save_id){
    var _dados = {
        plr :{
            
        },
        char : {
            x: obj_plr_rpg.x,
            y: obj_plr_rpg.y,
            hp: obj_plr_rpg.hp
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

function sv_load(save_id){
    if (file_exists(string_concat("save", save_id, ".json"))) {
        var _arquivo = file_text_open_read(string_concat("save", save_id, ".json"));
        var _texto = file_text_read_string(_arquivo);
        file_text_close(_arquivo);
        var _dados = json_parse(_texto);
        //char
        obj_plr_rpg.x = _dados.x;
        obj_plr_rpg.y = _dados.y;
        obj_plr_rpg.hp = _dados.hp;
        return _dados;
    }else{
        return false;
    }
}

function sv_delete(save_id){
    var _savename = string_concat("save", save_id, ".json")
    if (file_exists((_savename))) {
        file_delete(_savename)
        return 0;
    }else {
    	return 0;
    }
}

function sv_newgame(){
    room = rm_mappingtest
    var _mainmenu = ["MainLayer", "SavesLayer", "SettingsLayer"];
    for(var i =0;i<array_length(_mainmenu);i++){
        layer_set_visible(layer_get_id(_mainmenu[i]), false);
    }
}