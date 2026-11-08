
if (file_exists("save.ini")) {
    file_delete("save.ini");
}

ini_open("save.ini");

ini_write_real("player", "x", obj_plr_rpg.x);
ini_write_real("player", "y", obj_plr_rpg.y);
ini_write_real("player", "hp", obj_plr_rpg.hp);

ini_write_real("inventario", "quantidade", array_length(global.inv));

for (var i = 0; i < array_length(global.inv); i++) {
    ini_write_real("inventario", "sprite_" + string(i), global.inv[i].sprite);
    ini_write_string("inventario", "nome_" + string(i), global.inv[i].name);
}

ini_close();

show_debug_message("Jogo salvo!");
