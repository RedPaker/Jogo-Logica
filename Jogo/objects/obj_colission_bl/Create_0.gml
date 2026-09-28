
event_inherited();

depth = -90; 
image_xscale = 2.8;
image_yscale = 2.8;
offset_livro_x = -180;
offset_livro_y = -180; 
linha = 0;
bloco_encaixado = noone;

if (!variable_global_exists("blocks_col")) {
    global.blocks_col = [];
}


var _item_col_data = {
    id_instancia: id,
    sprite: object_get_sprite(object_index),
    linha: linha
};

array_push(global.blocks_col, _item_col_data);