hp -= other.damage;

image_blend = c_red;
alarm[1] = 10
    


// Direção do ataque
rc_x = lengthdir_x(1, other.image_angle);
rc_y = lengthdir_y(1, other.image_angle);

recuando = true;

if(hp == 0){
instance_destroy();
}