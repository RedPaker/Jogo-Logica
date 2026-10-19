y += vel_y
tempo--;

pisca = tempo/40

if (tempo == 0){
    instance_destroy()
}