if (obj_jukebox.explodiu){
    instance_create_layer(obj_jukebox.x,obj_jukebox.y,"Instances",obj_explosion_jk)
}

if (lifetime > 0){
    lifetime--
}

if (lifetime <= 0){
    instance_destroy()
}