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

    var _arquivo = file_text_open_write("save.json");
    file_text_write_string(_arquivo, _json);
    file_text_close(_arquivo);
