is_pressed = false;
depth = -150;
arrastando = false;
offset_x = 0;
offset_y = 0;
image_xscale = 2.8;
image_yscale = 2.8;
primeira = false;
aumenta = false;
a_frente = false;
hitbox_valido = -1  
valor_conferencia = 0
offset_inventario_x = 180;
offset_inventario_y = 0;

posicao_livro = function() {
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);

    x = (_centro_x + offset_inventario_x) + _cam_x;
    y = (_centro_y + offset_inventario_y) + _cam_y;
};


encaixe = function(){
    
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _escala_livro = 6;
    var _centro_livro_x = (sprite_get_width(spr_livro_feiticos_principal) * _escala_livro) / 2;
    var _centro_livro_y = (sprite_get_height(spr_livro_feiticos_principal) * _escala_livro) / 2;

    var _min_gui_x = (_centro_x - _centro_livro_x) + 200;
    var _max_gui_x = (_centro_x + _centro_livro_x) - 200;
    var _min_gui_y = (_centro_y - _centro_livro_y) + 80;
    var _max_gui_y = (_centro_y + _centro_livro_y) - 80;

    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    var _slot_grande = instance_place(x,y,obj_block_parent)
    var _slot_mini = instance_place(x, y, obj_colission_mini);
            if (_slot_mini != noone) {
                var _tem_bloco = false;

                if (_slot_grande.encaixado == true){
                    _tem_bloco = true
                }
                var _posicao_valida = (hitbox_valido == -1 || _slot_grande.accept_all  || _slot_mini.posicao == hitbox_valido) &&  !_slot_grande.no_block_valid;
                
                if (_tem_bloco && _posicao_valida) {
                    x = _slot_mini.x;
                    y = _slot_mini.y;
                    array_push(global.blocks, valor_conferencia)
                } else {
                    posicao_livro()
                }
                
            } else {
                posicao_livro()
            }
}