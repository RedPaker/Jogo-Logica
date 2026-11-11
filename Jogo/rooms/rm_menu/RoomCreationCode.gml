global.meu = 0
global.me1 = 1
global.me2 = 2
global.jogo_pausado = false;

global.chapter = 1;
global.inventario_itens = [];
global.current_save = 0;

if(!variable_global_exists("st_firsttimeplaying")){
    global.st_firsttimeplaying = true;
    show_debug_message("Reset");
    //Gameplay
    global.st_up = vk_up;
    global.st_left = vk_left;
    global.st_down = vk_down;
    global.st_right = vk_right;
    
    global.st_use = ord("Z");
    global.st_run = ord("X");
    global.st_inv = ord("C");
    
    global.st_umg = ord("A");
    global.st_smg = ord("S");
    
    global.st_sprinthold = true;
    
    global.st_cutsn = true;
    
    //Visual
    global.st_quality = 1; // 0 - Low; 1- Medium; 2 - High
    global.st_skin = 0; 
    /* 
     * 0 = Default
     * 1 =
     * 2 =
     * 3 =
     * ...    
    */
    //Audio
    global.st_music = 25/100;
    global.st_master = 25/100;
} 