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
                    msg: "Ufa... finalmente acordou."
                },
                {
                    name: "U+003A",
                    msg: "O senhor esta bem?"   
                }, 
                {
                    name: "U+003A",
                    msg: "Eu te vi desmaiado la fora e tentei te ajudar."
                },
                {
                    name: "0x43",
                    msg:"O-obrigado."
                }, 
                {
                    name: "U+003A",
                    msg: "Parece que algo esta infectando os moradores,\n mas voce pode me ajudar? "
                },
                {
                    name: "0x43",
                    msg: "Talvez... Acho que nao tenho muita escolha ne?"
                },
                {
                    name: "U+003A",
                    msg: "A situacao esta melhor vamos tentar encontrar\n outros que nao foram infectados."
                },
            ]
        break;
    
        case"fuga_dialog":
            
            return_value = [
                {
                    name: "Morador",
                    msg: "QUE SUSTO!!!!"
                },
                {
                    name: "0x43",
                    msg: "Tem alguma coisa no qual eu possa usar?"
                },
                {
                    name: "Morador",
                    msg: "So aquele mouse."
                },
                {
                    name: "Morador",
                    msg: "Estou com medo pegue e saia por favor."
                }
            ]
        break;
        
        case "Porteiro_dialog":
            
            return_value = [
                {
                    name: "Porteiro",
                    msg: "Voce é muito corajoso sabia?"
                },
                {
                    name: "Porteiro",
                    msg: "So voce consegue derrotar eles."
                },
                {
                    name: "Porteiro",
                    msg: "Tem algo atras do portao da vila, eu tranquei antes de\n invadir a vila."
                },
                {
                    name: "Porteiro",
                    msg: "Acha que da conta?"
                },
                {
                    name: "0x43",
                    msg: "Espero que sim..."
                },
                {
                    name: "Porteiro",
                    msg: "Ok, suba a rua e vire pra esquerda,\n voce ira encontrar a torre."
                },
                {
                    name: "Porteiro",
                    msg: "No alto dela tera um painel\n DIGITE: 183 e o portao ira abrir"
                },
                {
                    name: "0x43",
                    msg: "Ok."
                }
            ]
        break;
    
        case "tutorial_binario":
            return_value = [
                {
                    name: "0x43",
                    msg: "Como eu faco?\n so tem 0 e 1."
                },
                {
                    name: "U+003A",
                    msg: "Voce tera que digitar a senha 183 em binario."
                },
                {
                    name: "U+003A",
                    msg: "ESCUTE COM BASTANTE ATENCAO."
                },
                {
                    name: "U+003A",
                    msg: "Um numero em binario é um numero na base 2\n ou seja 0 e 1."
                },
                {
                    name: "U+003A",
                    msg: "um numero na base 10 é o numero no qual estamos acostumados."
                },
                {
                    name: "U+003A",
                    msg: "Por exemplo 44"
                },
                {
                    name: "U+003A",
                    msg: "Para transformar em binario precisamos fazer a divisao de 44 por 2."
                },
                {
                    name: "U+003A",
                    msg: "O resultado é 22 e o resto é 0\n LEMBRE DO RESTO!!!!!!"
                },
                {
                    name: "U+003A",
                    msg: "Faca o mesmo com 22 o resultado sera 11 e o resto 0."
                },
                {
                    name: "U+003A",
                    msg: "Com o 11 faça o mesmo o resultado sera 5 e o resto 1."
                },
                {
                    name: "U+003A",
                    msg: "Repita a divisao ate o resultado ser zero,\n anotando os restos"
                },
                {
                    name: "U+003A",
                    msg: "Por fim pegue o restos e escreva o numero em binario\n COMECE A ESCREVER PELO RESTO DA ULTIMA DIVISAO!"
                },
                {
                    name: "0x43",
                    msg: "A juntando os restos 44 em binario e 101100."
                },
                {
                    name: "0x43",
                    msg: "Faça isso com 183.\n divida por dois, anote os restos,\n e monte o numero comecando pelo ultimo resto. "
                },
                
            ]
        break;
        
        case "Estranho_ram_dialog":
            return_value = [
                {
                    name: "Estranho",
                    msg: "QuE FoII?"
                },
                {
                    name: "0x43",
                    msg: "... Nada nao"
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "Tchau."
                },
                {
                    name: "Estranho",
                    msg: "VEm AqUI!!!."
                },
                {
                    name: "Estranho",
                    msg: "Ta VeNDo EsSas MemoRIaS?\n VaI La e CaLIBRA elAs PRa mIm"
                },
                {
                    name: "0x43",
                    msg: "Por que?"
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "VAAAAAAIII LOGOOOOOoooooooOOOOOOOOOOO!!!!!!!!!!!!!!!!"
                },
                {
                    name: "0x43",
                    msg: "TA BOOOM!!!!!"
                },
            ]
            
            break;
                   
    }
    return return_value;
}

global.char_colors = {
    "U+003A": c_red,
    "0x43": c_blue,
    "morador": c_lime,
    "Porteiro": c_orange
}

global.sprites = {
    "U+003A": spr_speak_asterisco,
    "0x43": spr_speak_C
}