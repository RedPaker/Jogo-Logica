//TESTES
// Acompanha a posição do bloco maior em tempo real
if (instance_exists(bloco_mae)) {
    x = bloco_mae.x + offset_pai_x;
    y = bloco_mae.y + offset_pai_y;
} else {
    // Se o bloco maior for destruído, o slot menor também é
    instance_destroy();
}