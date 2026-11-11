if (!ativo) exit;

if (estado == 0) {
    anim = min(1, anim + 0.08);
    if (anim >= 1) estado = 1;
} else if (estado == 1) {
    espera--;
    if (espera <= 0) estado = 2;
} else {
    anim = max(0, anim - 0.08);
    if (anim <= 0) ativo = false;
}