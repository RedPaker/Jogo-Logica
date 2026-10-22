show_debug_message("TOuched")
if (warpto_room == noone) {
    if(warpto_x != -1){
        player.x=warpto_x
    }
    if(warpto_y != -1){
        player.y=warpto_y
    }
}else {
    room = warpto_room
    if(warpto_x != -1){
        player.x=warpto_x
    }
    if(warpto_y != -1){
        player.y=warpto_y
    }
}