desbloqueados = 0;
if (instance_exists(obj_plr_rpg)) {
    var _hpmax = obj_plr_rpg.hp_max;
    var _hp = obj_plr_rpg.hp;
    var _text_id = layer_text_get_id(layer, "text_1F36EB49");
    if(object_exists(obj_controller_mg)){
        var _unlockedspells = obj_controller_mg.unlocked_spells
        
        var _nomes = variable_struct_get_names(_unlockedspells);
        var _tamanho = array_length(_nomes);
        var _contador_true = 0;
        
        for (var i = 0; i < _tamanho; i++) {
            var nome_da_variavel = _nomes[i];
            
            var valor = variable_struct_get(_unlockedspells, nome_da_variavel);
            
            if (valor == true) {
                desbloqueados++;
            }
        }
        
        if (_text_id != -1) {
        layer_text_text(_text_id, "HP:" + string(_hp) + " / " + string(_hpmax) + "\n" + string(desbloqueados) + " Feitiços");
    }
    }else {
    	if (_text_id != -1) {
        layer_text_text(_text_id, "HP:" + string(_hp) + " / " + string(_hpmax));
    }
    }
}