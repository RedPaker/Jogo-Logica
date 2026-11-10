if (slot_id >= 0 && slot_id < array_length(global.inventario_itens)) {
    
    var _item = global.inventario_itens[slot_id];
    
    // Altera o sprite do objeto para o sprite da array
    sprite_index = _item.sprite;
    
    // Pega o ID do texto usando o nome da camada e a variável (ex: "text_9FBDEB2")
    var _text_id = layer_text_get_id("InventarioLayer", meu_texto_id); 
    
    // Verifica se o elemento de texto existe na camada e altera a string exibida
    if (layer_text_exists("InventarioLayer", _text_id)) {
        layer_text_text(_text_id, _item.nome); 
    }
}else {
	sprite_index = -1
    var _text_id = layer_text_get_id("InventarioLayer", meu_texto_id); 
    if (layer_text_exists("InventarioLayer", _text_id)) {
        layer_text_text(_text_id, ""); // Clear the text
    }
    
}