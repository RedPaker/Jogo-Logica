

if (keyboard_check_pressed(global.st_inv)) {
    menuaberto = !menuaberto
    global.jogo_pausado = menuaberto
    layer_set_visible("MenuLayer", menuaberto);
    if (menuaberto == false) {
    	layer_set_visible("InventarioLayer", menuaberto);
    }
}
