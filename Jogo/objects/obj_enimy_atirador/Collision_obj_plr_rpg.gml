if (other.dano_time <= 0 && other.hp > 0) {
    other.hp -= 6;
    other.dano_time = 20;
    other.impacto = 5;
    other.empurra = 3;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
}