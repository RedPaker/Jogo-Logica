if (abrir){
    var xx = 9
    var yy = 9
    var size = 81
    
    for(var i = 0; i < invmaxX; i++){
        for(var j = 0; j < invmaxY; j++ ){
            var _slot = j * invmaxX + i; 
            
            //draw_rectangle(xx + size * i, yy + size * j, xx+size * (1+i), yy + size * (1+j), true) 
            if(i==0 and j==0){
                draw_sprite_ext(spr_invtr_placeholder, 1, xx + (size*i)+size/2, yy + (size*j)+size/2, size/sprite_get_width(spr_magenta), size/sprite_get_height(spr_magenta), 0, c_white, .75);
            }else{
            	draw_sprite_ext(spr_invtr_placeholder, 0, xx + (size*i)+size/2, yy + (size*j)+size/2, size/sprite_get_width(spr_magenta), size/sprite_get_height(spr_magenta), 0, c_white, .75);
            }
                
            
            if (_slot < array_length(global.inv)) {
                var _px = xx + size * i; 
                var _py = yy + size * j;    
                var _item = global.inv[_slot];
                var _escala = size / sprite_get_width(_item.sprite);
                draw_sprite_ext(_item.sprite, 0, _px + size/2, _py + size/2, _escala, _escala, 0, c_white, 1);
                draw_text_colour( _px/* + size/2*/, _py/* + size/2*/, _item.name, c_fuchsia, c_teal, c_purple, c_orange, 100)
            }
        }
    }
}

