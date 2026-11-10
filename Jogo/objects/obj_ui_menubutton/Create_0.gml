function findbynome(na){
    var _item_to_find = na; 
    var _found_index = -1;       
    
    for (var i = 0; i < array_length(global.inventario_itens); i++) {
        
        if (global.inventario_itens[i].nome == _item_to_find) {
            _found_index = i;
        }
    }
    return _found_index;
}