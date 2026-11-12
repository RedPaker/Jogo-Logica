if (global.jogo_pausado == true) {
    exit;
}

if (!other.imortal) {
    if (other.dano_time <= 0 && other.hp > 0) {
        other.empurra = 12;
        other.empurra_dir = point_direction(x, y, other.x, other.y);
    }
}