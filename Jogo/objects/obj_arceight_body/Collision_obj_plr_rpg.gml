if (global.jogo_pausado == true) {
    exit;
}
if (other.imortal = false){
    if (other.dano_time <= 0 && other.hp > 0) {
    other.dano_time = 20;
    other.empurra = 6;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
}
}
