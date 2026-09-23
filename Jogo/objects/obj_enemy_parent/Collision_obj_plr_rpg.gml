if (other.dano_time <= 0 && other.hp > 0) {
    other.hp -= 10;
    other.dano_time = 20;
    other.impacto = 7;
    other.empurra = 6;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
}