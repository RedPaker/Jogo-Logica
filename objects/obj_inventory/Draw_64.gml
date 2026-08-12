if (abrir){
    var xx = 10
    var yy = 10
    var size = 100
    
    for(var i = 0; i < invmaxX; i++){
        for(var j = 0; j < invmaxY; j++ ){
        var _slot = j * invmaxX + i; 
            
        draw_rectangle(xx + size * i, yy + size * j, xx+size * (1+i), yy + size * (1+j), true)
            
            if (_slot < array_length(global.inv)) {
                var _px = xx + size * i; 
                var _py = yy + size * j;    
                var _item = global.inv[_slot];
                var _escala = size / sprite_get_width(_item.sprite);
                draw_sprite_ext(_item.sprite, 0, _px + size/2, _py + size/2, _escala, _escala, 0, c_white, 1);
                draw_text( _px + size/2, _py + size/2, _item.name)
            }
        }
    }
}