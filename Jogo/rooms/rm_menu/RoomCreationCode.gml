if(!variable_global_exists("st_firsttimeplaying")){
    global.st_firsttimeplaying = true;
    show_debug_message("Reset");
    //Gameplay
    global.st_up = vk_up;
    global.st_left = vk_left;
    global.st_down = vk_down;
    global.st_right = vk_right;
    
    global.st_use = vk_space;
    global.st_run = ord("X");
    global.st_inv = ord("C");
    
    global.st_mg1 = ord("A");
    global.st_mg2 = ord("S");
    global.st_mg3 = ord("D");
    
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