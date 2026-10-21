function save(save_id){
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

function check(save_id){
    if(file_exists(string_concat("save", save_id, ".json"))){
        var _arquivo = file_text_open_read(string_concat("save", save_id, ".json"));
        var _texto = file_text_read_string(_arquivo);
        file_text_close(_arquivo);
        var _dados = json_parse(_texto);
        return _dados;
    }else {
    	return false;
    }
}

function load(save_id){
    if (file_exists(string_concat("save", save_id, ".json"))) {
        var _arquivo = file_text_open_read(string_concat("save", save_id, ".json"));
        var _texto = file_text_read_string(_arquivo);
        file_text_close(_arquivo);
        var _dados = json_parse(_texto);
        //char
        obj_plr_rpg.x = _dados.x;
        obj_plr_rpg.y = _dados.y;
        obj_plr_rpg.hp = _dados.hp;
    }else{
        return 0;
    }
}