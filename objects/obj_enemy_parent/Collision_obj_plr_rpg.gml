if (other.dano_time <= 0 && other.hp > 0) {
    other.hp -= 10;
    other.dano_time = 60;

    other.empurra = 6.7;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
    
    other.image_blend = #fc6767;
}