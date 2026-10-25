messages = [];
current_message = -1;
current_char = 0;
draw_message = "";

char_speed = 0.5;
input_key = vk_enter;

// Obtém a largura e altura da câmara do Viewport 0 
var _view_width = camera_get_view_width(view_camera[0]); 
var _view_height = camera_get_view_height(view_camera[0]); 

// Força a camada GUI a ter o mesmo tamanho de pixéis do viewport 
display_set_gui_size(_view_width, _view_height);  


gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

