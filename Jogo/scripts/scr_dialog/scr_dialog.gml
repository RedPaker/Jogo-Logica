function d_create_dialog(_messages){
    if (instance_exists(obj_dialogo)) return;
        
    var _inst = instance_create_depth(0,0,0, obj_dialogo);
    _inst.messages = _messages
    _inst.current_message = 0;
}

function d_select_dialog(_is){
    return_value = -1 
    switch (_is) {
    	case "welcome_dialog":
            return_value = [
                {
                    name: "U+003A",
                    msg: "Oi?... Alo?..."
                },
                {
                    name: "U+003A",
                    msg: "O senhor esta bem?"   
                }, 
                {
                    name: "U+003A",
                    msg: "Eu te vi desmaiado la fora e descidi ajudar"
                },
                 {
                    name: "U+003A",
                    msg: "Parece que algo esta infectando os moradores,\n mas você pode me ajudar? "
                },
                {
                    name: "0x43",
                    msg: "Talvez... Acho que nao tenho muita escolha ne?"
                },
                {
                    name: "U+003A",
                    msg: "a situacao esta melhor vamos tentar encontrar\n outros que nao foram infectados"
                },
            ]
        break;
    }
    return return_value;
}

global.char_colors = {
    "U+003A": c_red,
    "0x43": c_blue
}

global.sprites = {
    "U+003A": spr_speak_asterisco,
    "0x43": spr_speak_C
}