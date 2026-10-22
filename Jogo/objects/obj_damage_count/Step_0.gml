y += vel_y;
tempo--;

alpha = tempo / 40;

if (tempo <= 0) {
    instance_destroy();
}