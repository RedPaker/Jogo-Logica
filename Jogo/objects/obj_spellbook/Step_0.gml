// B não fecha o livro durante o tutorial
if (keyboard_check_pressed(ord("B")) && obj_plr_rpg.coletou_livro && !tut_ativo){
    abrir = !abrir;
}

// ao abrir: cria blocos e slots e prepara o tutorial
if (abrir && !slots_criados){
    spawn_blocos_pagina(pagina_atual)
    spawn_blocos_colisao()
    preparar_tutorial();
}

if (slots_criados == true && keyboard_check_pressed(ord("B")) && !tut_ativo){
    slots_criados = false
    desenhar = false
}

// setas travadas durante o tutorial
if (abrir && !tut_ativo) {
    if (keyboard_check_pressed(vk_right) && pagina_atual < array_length(global.paginas_spawn_data) - 1) {
        pagina_atual++;
        spawn_blocos_pagina(pagina_atual);
        desenhar = false;
        preparar_tutorial();
    }
    if (keyboard_check_pressed(vk_left) && pagina_atual > 0) {
        pagina_atual--;
        spawn_blocos_pagina(pagina_atual);
        desenhar = false;
        preparar_tutorial();
    }
}

if (keyboard_check_pressed(vk_enter) && !pagina_bloqueada(pagina_atual) && abrir && !tut_ativo){
    verificacao(pagina_atual)
}

if (!abrir && global.aviso_pagina_tempo > 0) global.aviso_pagina_tempo--;

function pix_rect(_ox, _oy, _p, _x1, _y1, _x2, _y2, _cor) {
    draw_set_color(_cor);
    draw_rectangle(_ox + _x1 * _p, _oy + _y1 * _p, _ox + _x2 * _p - 1, _oy + _y2 * _p - 1, false);
}

// --- tutorial dos blocos ---
// --- tutorial ---
if (tut_ativo) {
    tut_alpha = min(0.75, tut_alpha + 0.05);

    if (tut_estado == 0 && tut_alpha >= 0.75) {
        d_create_dialog(tut_fila[tut_idx].msgs);
        tut_estado = 1;
    } else if (tut_estado == 1 && !instance_exists(obj_dialogo)) {
        tut_idx++;
        if (tut_idx >= array_length(tut_fila)) {
            tut_ativo = false;
        } else {
            tut_estado = 0;
        }
    }
} else {
    tut_alpha = max(0, tut_alpha - 0.05);
}
