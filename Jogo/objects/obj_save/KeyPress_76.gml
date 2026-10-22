
if (file_exists("save.json")) {
    var _arquivo = file_text_open_read("save.json");
    var _texto = file_text_read_string(_arquivo);
    file_text_close(_arquivo);
var _dados = json_parse(_texto);
    obj_plr_rpg.x = _dados.x;
    obj_plr_rpg.y = _dados.y;
    obj_plr_rpg.hp = _dados.hp;
}

