
if (file_exists("save.ini")) {
    ini_open("save.ini");

    obj_plr_rpg.x = ini_read_real("player", "x", 0);
    obj_plr_rpg.y = ini_read_real("player", "y", 0);
    obj_plr_rpg.hp = ini_read_real("player", "hp", 100);

    global.inv = [];

    var _inv = ini_read_real("inventario", "quantidade", 0);

    for (var i = 0; i < _inv; i++) {
        var _sprite = ini_read_real("inventario", "sprite_" + string(i), -1);
        var _nome = ini_read_string("inventario", "nome_" + string(i), "");

        array_push(global.inv, {
            name: _nome,
            sprite: _sprite
        });
    }

    ini_close();


}
