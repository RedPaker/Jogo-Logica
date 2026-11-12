function cutscene_play(_passos, _ao_terminar = undefined) {
    if (instance_exists(obj_cutscene)) return;
    var _c = instance_create_depth(0, 0, 100, obj_cutscene);
    _c.passos = _passos;
    _c.ao_terminar = _ao_terminar;
}