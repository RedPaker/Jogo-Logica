//audio_play_sound(snd_NewFriendly_KevinMacleod, 10, true,1*global.st_master*global.st_music);
if (!instance_exists(obj_plr_rpg)) {
    instance_create_layer(280, 272, "Entities", obj_plr_rpg); 
}
if (!instance_exists(obj_cam)) {
    instance_create_layer(280, 272, "Entities", obj_cam);
}

if (!instance_exists(obj_spellbook)) instance_create_layer(0, 0, "Sistemas", obj_spellbook); 
if (!instance_exists(obj_save))      instance_create_layer(0, 0, "Sistemas", obj_save); 
if (!instance_exists(obj_inventory)) instance_create_layer(0, 0, "Sistemas", obj_inventory);
