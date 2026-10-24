function create_dialog(_messages){
    if (instance_exists(obj_dialogo)) return;
        
    var _inst = instance_create_depth(0,0,0, obj_dialogo);
    _inst.messages = _messages
    _inst.current_message = 0;
}