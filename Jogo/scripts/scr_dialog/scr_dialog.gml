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
                    name: "Astolfo",
                    msg: "Subi no pe de pera pra pega uma pera"
                },
                {
                    name: "Astolfo",
                    msg: "A pera tava podi eu desci cum a goiaba"   
                }, 
                {
                    name: "Astolfo",
                    msg: "O trem anda no ar, aviao anda na linha"
                },
                 {
                    name: "Astolfo",
                    msg: "A vaca bota ovo, e o ovo tira leite da galinha kkkkkkk"
                },
                {
                    name: "0x43",
                    msg: "Ta chapando loco"
                },
                {
                    name: "Astolfo",
                    msg: "aaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAb"
                }
            ]
        break;
    }
    return return_value;
}

global.char_colors = {
    "Astolfo": c_red,
    "0x43": c_blue
}

global.sprites = {
    "Astolfo": spr_plr_placeholder,
    "0x43": spr_plr_speak
}