is_pressed = false;
depth = -100;
arrastando = false;
offset_x = 0;
offset_y = 0;
image_xscale = 2.8;
image_yscale = 2.8;
primeira = false;
aumenta = false;
offset_inventario_x = 180;
offset_inventario_y = 0;
valor_conferencia = 0
send = false
no_block_valid = false
encaixado = false
accept_all = false
criou_rabinho = false;
rabinho_instancia = noone;
encontrou = false
qt = 1

verificar_bloco_while = function() {
    var _linha_while = -1;

    // Descobre a linha do bloco while
    with (obj_colission_bl) {
        var _bloco = instance_place(x, y, obj_bloco_while);

        if (_bloco != noone) {
            _linha_while = linha;
        }
    }

    if (_linha_while != -1) {

        if (!criou_rabinho) {

            // Guarda a linha seguinte em uma variável local
            var _linha_rabo = _linha_while + qt;

            with (obj_colission_bl) {
                if (linha == _linha_rabo) {

                    var _algo = instance_create_layer(
                        x - 68,
                        y,
                        "Instances",
                        obj_bloco_while_rabo
                    );
                    _algo.slot_pai = id;
                }
            }

            criou_rabinho = true;
            
            var _bloco = instance_place(x, y, obj_bloco_while);
            var _ta_no_while = instance_place(x,y,_bloco)
            
            if (_ta_no_while){
                with (obj_bloco_while_rabo) {
                instance_destroy();
            }
                qt += 1
                criou_rabinho = false
                show_debug_message("Oi")
                y += 50
            }
        }

    } else {

        if (criou_rabinho) {
            with (obj_bloco_while_rabo) {
                instance_destroy();
            }
            criou_rabinho = false;
        }
    }
}