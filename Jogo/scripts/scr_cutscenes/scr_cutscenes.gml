function iniciar_cutscene(_sprite_da_cutscene) {
    global.jogo_pausado = true;
    
    // Cria o objeto que vai tocar a animação no meio da tela (ajuste a layer)
    var _cutscene = instance_create_layer(room_width/2, room_height/2, "Instances", obj_cutscene);
    _cutscene.sprite_index = _sprite_da_cutscene;
}