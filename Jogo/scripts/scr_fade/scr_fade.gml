function scr_fade(_destion, _x, _y){
   if (!instance_exists(obj_fade)) {
        var _fade = instance_create_depth(0, 0, -9999, obj_fade);
        _fade.sala_destino = _destion;
        _fade.destino_x = _x;
        _fade.destino_y = _y;
    }
}