
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

    if (variable_struct_exists(_s, "sprite")) {
        spr = _s.sprite;
        zoom = 1;
        zoom_alvo = 1;
    }
    if (variable_struct_exists(_s, "frame")) frame = _s.frame;
    anim_fps = opt(_s, "anim", 0);


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


if (abs(fade_alvo - fade_a) > 0.001) exit;


if (espera > 0) { 
    espera--; 
    exit; 
}


if (msgs != undefined && !dialogo_iniciado) {
    d_create_dialog(msgs);
    dialogo_iniciado = true;
    exit;
}


if (dialogo_iniciado && instance_exists(obj_dialogo)) exit;

if (abs(fade_alvo - fade_a) > 0.001) exit;

if (espera > 0) { 
    espera--; 
    exit; 
}


if (msgs != undefined && !dialogo_iniciado) {
    d_create_dialog(msgs);
    dialogo_iniciado = true;
    exit;
}

// 4. Se o diálogo foi iniciado, espera ele fechar completamente
if (dialogo_iniciado && instance_exists(obj_dialogo)) exit;

var _auto = opt(passo, "auto", false); 

if (msgs == undefined && !_auto) {
  
    if (!aguardando_tecla) {
        aguardando_tecla = true;
    }
    
    if (keyboard_check_pressed(vk_anykey)) {
        aguardando_tecla = false;
        estado = 0; 
        exit;
    }
    exit;
}


aguardando_tecla = false;
estado = 0;

var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);

if (spr != noone) {
    var _sw = sprite_get_width(spr);
    var _sh = sprite_get_height(spr);
    var _esc = max(_w / _sw, _h / _sh) * zoom;   // preenche a tela

    var _tx = 0, _ty = 0;
    if (shake_t > 0) {
        var _f = shake_t / shake_dur;
        _tx = random_range(-1, 1) * shake_mag * _f;
        _ty = random_range(-1, 1) * shake_mag * _f;
    }

    var _dx = _w / 2 + _tx - (_sw / 2 - sprite_get_xoffset(spr)) * _esc;
    var _dy = _h / 2 + _ty - (_sh / 2 - sprite_get_yoffset(spr)) * _esc;
    draw_sprite_ext(spr, frame, _dx, _dy, _esc, _esc, 0, c_white, 1);
}

if (flash_a > 0) {
    draw_set_alpha(flash_a);
    draw_set_color(c_white);
    draw_rectangle(0, 0, _w, _h, false);
}

if (fade_a > 0) {
    draw_set_alpha(fade_a);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
}


if (aguardando_tecla) {
    var _alpha_pisca = (sin(current_time / 150) + 1) * 0.5; 
    
    draw_set_alpha(_alpha_pisca);
    draw_set_color(c_white);
    
    
    draw_rectangle(_w - 48, _h - 48, _w - 24, _h - 24, false);
}

draw_set_alpha(1);
draw_set_color(c_white);