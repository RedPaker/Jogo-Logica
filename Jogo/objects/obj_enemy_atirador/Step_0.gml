// Inherit the parent event
event_inherited();
    tiro_time --;
if (!apaixonado){
     if(tiro_time <= 0){
        var _tiro = instance_create_layer(
            x,
            y,
            "instances",
            obj_tiro_atirador
        );
        tiro_time = tiro_cadencia;
    }
}

