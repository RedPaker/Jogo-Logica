messages = [];
current_message = -1;
current_char = 0;
draw_message = "";

char_speed = 0.5;
input_key = global.st_use ;

/* Obtém a largura e altura da câmara do Viewport 0 
var _view_width = camera_get_view_width(view_camera[0]); 
var _view_height = camera_get_view_height(view_camera[0]); 

// Força a camada GUI a ter o mesmo tamanho de pixéis do viewport 
display_set_gui_size(_view_width, _view_height);  */


gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

global.jogo_pausado = true
instance_deactivate_layer("Entities");
instance_deactivate_layer("Itens");
instance_deactivate_layer("Misc");

estado = 0;          // 0 = abrindo, 1 = aberto, 2 = fechando
anim = 0;            // 0 a 1, progresso da abertura do balão
anim_vel = 0.08;     // maior = mais rápido
zoom = 0;            // 0 a 1, progresso do zoom do retrato
ultimo_nome = "";

ease_out_cubic = function(_t) {
    return 1 - power(1 - _t, 3);
}

// passa um pouco de 1 e volta, dá o efeito de "pop"
ease_out_back = function(_t) {
    var _c1 = 1.70158;
    var _c3 = _c1 + 1;
    return 1 + _c3 * power(_t - 1, 3) + _c1 * power(_t - 1, 2);
}

tem_alvo = false;
alvo_x = 0;
alvo_y = 0;

cam = view_camera[0];
cam_x0 = camera_get_view_x(cam);
cam_y0 = camera_get_view_y(cam);
cam_w0 = camera_get_view_width(cam);
cam_h0 = camera_get_view_height(cam);
zoom_cam = 1.6;   // 1 = sem zoom, maior = mais perto