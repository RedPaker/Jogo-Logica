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
    room_goto(warpto_room)
    if(warpto_x != -1){
        player.x=warpto_x
    }
    if(warpto_y != -1){
        player.y=warpto_y
    }
}