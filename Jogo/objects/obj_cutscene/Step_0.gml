// pular a cutscene inteira
if (keyboard_check_pressed(tecla_pular)) {
    if (instance_exists(obj_dialogo)) instance_destroy(obj_dialogo);
    // Reativa as camadas antes de destruir
    instance_activate_layer("Entities");
    instance_activate_layer("Itens");
    instance_activate_layer("Misc");
    global.cutscene_ativa = false;
    global.jogo_pausado = false;
    if (ao_terminar != undefined) ao_terminar();
    instance_destroy();
    exit;
}

// efeitos que rodam o tempo todo
fade_a += clamp(fade_alvo - fade_a, -fade_vel, fade_vel);
flash_a = max(0, flash_a - 0.05);
if (shake_t > 0) shake_t--;
zoom += (zoom_alvo - zoom) * 0.02;

if (anim_fps > 0 && spr != noone) {
    frame += anim_fps / game_get_speed(gamespeed_fps);
    frame = frame mod sprite_get_number(spr);
}

global.jogo_pausado = true;

// --- começa um passo novo ---
if (estado == 0) {
    idx++;
    if (idx >= array_length(passos)) { 
        instance_activate_layer("Entities");
        instance_activate_layer("Itens");
        instance_activate_layer("Misc");
        global.cutscene_ativa = false;
        global.jogo_pausado = false;
        if (ao_terminar != undefined) ao_terminar();
        instance_destroy(); 
        exit; 
    }

    passo = passos[idx];
    var _s = passo;

    // imagem de fundo (se não informar, mantém a anterior)
    if (variable_struct_exists(_s, "sprite")) {
        spr = _s.sprite;
        zoom = 1;
        zoom_alvo = 1;
    }
    if (variable_struct_exists(_s, "frame")) frame = _s.frame;
    anim_fps = opt(_s, "anim", 0);

    // fade: "in" = sai do preto, "out" = vai para o preto
    var _f = opt(_s, "fade", "");
    fade_vel = opt(_s, "fade_vel", 0.03);
    if (_f == "in")  { fade_a = 1; fade_alvo = 0; }
    if (_f == "out") { fade_alvo = 1; }

    // efeitos
    if (opt(_s, "flash", false)) flash_a = 1;
    if (variable_struct_exists(_s, "shake")) {
        shake_t = _s.shake;
        shake_dur = max(1, _s.shake);
        shake_mag = opt(_s, "shake_force", 12);
    }
    if (variable_struct_exists(_s, "zoom")) zoom_alvo = _s.zoom;

    // sons
    if (variable_struct_exists(_s, "snd")) audio_play_sound(_s.snd, 1, false);
    if (variable_struct_exists(_s, "music")) {
        if (musica != noone) audio_stop_sound(musica);
        musica = audio_play_sound(_s.music, 1, true);
    }

    // diálogo
    msgs = undefined;
    dialogo_iniciado = false;
    if (variable_struct_exists(_s, "dialog")) {
        msgs = is_string(_s.dialog) ? d_select_dialog(_s.dialog) : _s.dialog;
    }

    espera = opt(_s, "wait", 0) * game_get_speed(gamespeed_fps);
    aguardando_tecla = false;
    
    estado = 1;
    exit;
}

// --- executa o passo ---
// 1. Espera o fade de saída/entrada estabilizar antes de fazer qualquer outra coisa
if (abs(fade_alvo - fade_a) > 0.001) exit;

// 2. Se houver tempo de espera programado em segundos
if (espera > 0) { 
    espera--; 
    exit; 
}

// 3. Se houver diálogo e ele ainda não foi aberto, abre agora
if (msgs != undefined && !dialogo_iniciado) {
    d_create_dialog(msgs);
    dialogo_iniciado = true;
    exit;
}

// 4. Se o diálogo foi iniciado, espera ele fechar completamente
if (dialogo_iniciado && instance_exists(obj_dialogo)) exit;

// --- executa o passo ---
// 1. Espera o fade de saída/entrada estabilizar antes de fazer qualquer outra coisa
if (abs(fade_alvo - fade_a) > 0.001) exit;

// 2. Se houver tempo de espera programado em segundos
if (espera > 0) { 
    espera--; 
    exit; 
}

// 3. Se houver diálogo e ele ainda não foi aberto, abre agora
if (msgs != undefined && !dialogo_iniciado) {
    d_create_dialog(msgs);
    dialogo_iniciado = true;
    exit;
}

// 4. Se o diálogo foi iniciado, espera ele fechar completamente
if (dialogo_iniciado && instance_exists(obj_dialogo)) exit;

// 5. VERIFICAÇÃO DE AVANÇO (Automático vs Aguardando Tecla)
var _auto = opt(passo, "auto", false); // Verifica se o passo tem "auto: true"

if (msgs == undefined && !_auto) {
    // Se não tem diálogo E NÃO está configurado para ir sozinho, trava esperando tecla
    if (!aguardando_tecla) {
        aguardando_tecla = true;
    }
    
    if (keyboard_check_pressed(vk_anykey)) {
        aguardando_tecla = false;
        estado = 0; // Próximo passo
        exit;
    }
    exit;
}

// Se chegou aqui, ou tinha diálogo e ele fechou, ou o passo tem "auto: true"
aguardando_tecla = false;
estado = 0; // Vai direto para o próximo passo