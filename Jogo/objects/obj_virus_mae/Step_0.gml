switch (estado) {

    case "perseguir":

        if (instance_exists(obj_plr_rpg)) {
            alvo_x = obj_plr_rpg.x;
            alvo_y = obj_plr_rpg.y;

            var _hor = clamp(alvo_x - x, -1, 1);
            var _ver = clamp(alvo_y - y, -1, 1);

            move_and_collide(
                _hor * move_spd,
                _ver * move_spd,
                [tilemap_foreground]
            );

            tempo_estado++;

            if (tempo_estado >= dash_recarga) {
                dash_dir = point_direction(
                    x, y,
                    alvo_x, alvo_y
                );

                estado = "carregar";
                tempo_estado = 0;
            }
        }

    break;


    case "carregar":

        tempo_estado++;

        if (tempo_estado >= dash_carga) {
            estado = "dash";
            tempo_estado = 0;
        }

    break;


    case "dash":
        
        var _dash_x = lengthdir_x(dash_vel, dash_dir)
        var _dash_y = lengthdir_y(dash_vel, dash_dir)
        
        var _passos = ceil(dash_vel);
        
        for(var i = 0; i < _passos; i++){
            
            var _dx = _dash_x / _passos;
            var _dy = _dash_y / _passos;
            
            if(place_meeting(x + _dx, y + _dy, tilemap_foreground)){
                break;
            }
            
            x += _dx;
            y += _dy;
            
            var _jogador = instance_place(x, y, obj_plr_rpg);
            
            if(_jogador != noone){
                if(_jogador.dano_time <= 0 && _jogador.hp > 0){
                        _jogador.hp -= 30
                        _jogador.dano_time = 20;
                        _jogador.impacto = 18;
                        _jogador.empurra = 20;
                        _jogador.empurra_dir = dash_dir;
                }
                break;
            }
        }
        tempo_estado++;
            if (tempo_estado >= dash_dura) {
                estado = "filhos";
                tempo_parir = 60
                tempo_estado = 0;
        }
    break;

    case "filhos":
        tempo_parir--;
        if (tempo_parir <= 0) {
            var _quantidade = instance_number(obj_enimy_rpg);
            for (var i = 0; i < filhos; i++) {
                if (_quantidade < filhos_max) {
                    var _criou = false;
                    var _tentativas = 0;
                    
                    while (!_criou && _tentativas < 30) {
                    	var _ang = irandom(359);
                        var _dist = irandom_range(24, 40);
                        var _ex = x + lengthdir_x(_dist, _ang);
                        var _ey = y + lengthdir_y(_dist, _ang);
                    
                    if(!place_meeting(_ex, _ey, tilemap_foreground)){
                    instance_create_layer(
                        _ex,
                        _ey,
                        "instances",
                        obj_enimy_rpg
                    ); 
                
                    _quantidade++;
                    _criou = true;    
                        }
                        _tentativas++; 
                    }     
                }
            }
            estado = "perseguir";
            tempo_estado = 0;
        }
    break;
}