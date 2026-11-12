if (global.jogo_pausado == true) {
    exit;
}

if (!other.imortal) {
    if (other.dano_time <= 0 && other.hp > 0) {
        other.hp -=25;
        other.dano_time = 20;
    }
}