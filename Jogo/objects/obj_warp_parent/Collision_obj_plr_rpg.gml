show_debug_message("TOuched")


if (warpto_room == noone) {
    player.state = 4
    if(warpto_x != -1){
        player.x=warpto_x
    }
    if(warpto_y != -1){
        player.y=warpto_y
    }
    player.state = 0
}else {
    scr_fade(warpto_room,warpto_x,warpto_y);
}