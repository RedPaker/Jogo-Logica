if (musica != noone) audio_stop_sound(musica);

global.cutscene_ativa = false;
global.jogo_pausado = false;
instance_activate_layer("Entities");
instance_activate_layer("Itens");
instance_activate_layer("Misc");

if (ao_terminar != undefined) ao_terminar();