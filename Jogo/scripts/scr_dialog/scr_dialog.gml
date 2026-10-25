function create_dialog(_messages){
    if (instance_exists(obj_dialogo)) return;
        
    var _inst = instance_create_depth(0,0,0, obj_dialogo);
    _inst.messages = _messages
    _inst.current_message = 0;
}

global.char_colors = {
    "Astolfo": c_red,
    "Lil 67": c_blue
}

global.sprites = {
    "Astolfo": spr_plr_placeholder,
    "Lil 67": spr_plr_td_down
}


global.welcome_dialog = [
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
        name: "Lil 67",
        msg: "Ta chapando loco"
    },
    {
        name: "Astolfo",
        msg: "aaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAb"
    }
]