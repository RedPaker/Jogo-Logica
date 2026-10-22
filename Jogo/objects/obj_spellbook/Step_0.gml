
if (keyboard_check_pressed(ord("B"))){
    abrir = !abrir;
}



if (abrir && !slots_criados){
    spawn_blocos_pagina(pagina_atual)
    spawn_blocos_colisao()
}


if (slots_criados == true && keyboard_check_pressed(ord("B"))){
    slots_criados = false
}

if (keyboard_check_pressed(vk_right)){
    pagina_atual++
    spawn_blocos_pagina(pagina_atual)
}

if (keyboard_check_pressed(vk_left)){
    if (pagina_atual > 0) {
        pagina_atual--;
        spawn_blocos_pagina(pagina_atual);
    }
}


if (keyboard_check_pressed(vk_enter)){
    verificacao(pagina_atual)
}

