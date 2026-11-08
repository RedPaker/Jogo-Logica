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
blk = noone
saiu = false
e_while = false
amarz = 0
y_bloco = 50
criou_rabinho_if = false;
rabinho_instancia_if = noone;
encontrou = false;
blk_if = noone;
saiu = false;
e_if = false;
amarz_if = 0;
y_bloco_if = 50;
qt_if = 1;
criou_rabinho_if = false;
rabinho_instancia_if = noone;
encontrou = false;
blk_if = noone;
saiu = false;
e_if = false;
amarz_if = 0;
y_bloco_if = 50;
qt_if = 1;


verificar_bloco_while = function() {
    var _linha_while = -1;

    with (obj_colission_bl) {
        var _bloco = instance_place(x, y, obj_bloco_while);

        // Só vale um WHILE que já foi solto no slot (não o que está sendo arrastado)
        if (_bloco != noone && _bloco.encaixado && !_bloco.arrastando) {
            _linha_while = linha;
        }
    }
    amarz = _linha_while

    if (_linha_while != -1) {

        if (!criou_rabinho) {

            var _linha_rabo = _linha_while + obj_bloco_while.qt;

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
            if (_bloco != noone && (!_bloco.encaixado || _bloco.arrastando)) _bloco = noone;
            //var _ta_no_while = instance_place(x,y,_bloco)
            if (_bloco != noone){
                blk = _bloco
            }
            
            
                if (_bloco){
                with (obj_bloco_while_rabo) {
                instance_destroy(); 
            }
                obj_bloco_while.qt += 1 
                    var _altura_total = (obj_bloco_while.qt -1) * 50
                criou_rabinho = false
                show_debug_message("Oi")
                y += _altura_total 
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

saiu_do_while = function(){
            show_debug_message("Oie")
        with (obj_bloco_while_rabo){
            instance_destroy()
        }
        if (criou_rabinho) {
            obj_bloco_while.qt -= 1
            var _linha_rabo = amarz + obj_bloco_while.qt;

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

            criou_rabinho = false;
    } 
        amarz = 0
        blk = noone
}

verificar_bloco_if = function() {
    var _linha_if = -1;

    with (obj_colission_bl) {
        var _bloco = instance_place(x, y, obj_bloco_if);

        // Só vale um IF que já foi solto no slot (não o que está sendo arrastado)
        if (_bloco != noone && _bloco.encaixado && !_bloco.arrastando) {
            _linha_if = linha;
        }
    }
    amarz_if = _linha_if;

    if (_linha_if != -1) {

        if (!criou_rabinho_if) {

            var _linha_rabo = _linha_if + obj_bloco_if.qt_if;

            with (obj_colission_bl) {
                if (linha == _linha_rabo) {

                    var _algo = instance_create_layer(
                        x - 68,
                        y,
                        "Instances",
                        obj_bloco_if_rabo
                    );
                    _algo.slot_pai = id;
                }
            }

            criou_rabinho_if = true;
            
            var _bloco = instance_place(x, y, obj_bloco_if);
            if (_bloco != noone && (!_bloco.encaixado || _bloco.arrastando)) _bloco = noone;
            if (_bloco != noone){
                blk_if = _bloco;
            }
            
            if (_bloco){
                with (obj_bloco_if_rabo) {
                    instance_destroy();  
                }
                obj_bloco_if.qt_if += 1;  
                var _altura_total = (obj_bloco_if.qt_if - 1) * 50;
                criou_rabinho_if = false;
                show_debug_message("Oi IF");
                y += _altura_total;  
            }
        }

    } else {
        if (criou_rabinho_if) {
            with (obj_bloco_if_rabo) {
                instance_destroy();
            }
            criou_rabinho_if = false;
        }
    }
}

saiu_do_if = function(){
    show_debug_message("Oie IF");
    with (obj_bloco_if_rabo){
        instance_destroy();
    }
    if (criou_rabinho_if) {
        obj_bloco_if.qt_if -= 1;
        var _linha_rabo = amarz_if + obj_bloco_if.qt_if;

        with (obj_colission_bl) {
            if (linha == _linha_rabo) {

                var _algo = instance_create_layer(
                    x - 68,
                    y,
                    "Instances",
                    obj_bloco_if_rabo
                );
                _algo.slot_pai = id;
            }
        }

        criou_rabinho_if = false;
    }   
    amarz_if = 0;
    blk_if = noone;
}
