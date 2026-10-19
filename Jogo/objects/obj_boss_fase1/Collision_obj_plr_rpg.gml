if (other.dano_time <= 0 && other.hp > 0) {
    other.hp -= 30;
    other.dano_time = 20;
    other.impacto = 10;
    other.empurra = 8;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
}