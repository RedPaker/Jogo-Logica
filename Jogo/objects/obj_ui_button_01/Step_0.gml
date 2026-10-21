if (wait==true){
    var _key = keyboard_key;
    show_debug_message(_key)
    if (_key != vk_escape and _key != vk_nokey){
        global.st_use = _key;
        wait = false
    }else if(_key == vk_escape){
        wait = false
    }
}
