if(!variable_global_exists("firsttimeplaying")){
    global.st_firsttimeplaying = true;
    
    global.st_up = vk_up;
    global.st_left = vk_left;
    global.st_down = vk_down;
    global.st_right = vk_right;
    
    global.st_use = ord("Z");
    global.st_run = ord("X");
    global.st_inv = ord("C");
    
    global.st_mg1 = ord("A");
    global.st_mg2 = ord("S");
    global.st_mg3 = ord("D");
    
    global.st_sprinthold = true;
    
    global.st_cutsn = true;
    
    global.st_music = 50/100;
    global.st_master = 100/100;
} 