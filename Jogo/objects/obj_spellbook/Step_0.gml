
if (keyboard_check_pressed(ord("B"))){
    abrir = !abrir;
}

if(abrir == true){
    global.jogo_pausado = true
}else {
	global.jogo_pausado = false
}

if (abrir && !slots_criados){
    spawn_blocos_pagina(pagina_atual)
    spawn_blocos_colisao()
}




if (slots_criados == true && keyboard_check_pressed(ord("B"))){
    slots_criados = false
    desenhar = false
}

if (keyboard_check_pressed(vk_right)){
    pagina_atual++
    spawn_blocos_pagina(pagina_atual)
    desenhar = false
}

if (keyboard_check_pressed(vk_left)){
    if (pagina_atual > 0) {
        pagina_atual--;
        spawn_blocos_pagina(pagina_atual);
    }
    desenhar = false
}


if (keyboard_check_pressed(vk_enter) && !pagina_bloqueada(pagina_atual)){
    verificacao(pagina_atual)
}

if (global.aviso_pagina_tempo > 0) global.aviso_pagina_tempo--;

function pix_rect(_ox, _oy, _p, _x1, _y1, _x2, _y2, _cor) {
    draw_set_color(_cor);
    draw_rectangle(_ox + _x1 * _p, _oy + _y1 * _p, _ox + _x2 * _p - 1, _oy + _y2 * _p - 1, false);
}

