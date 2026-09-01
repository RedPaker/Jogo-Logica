//oi
// Só desenha no mundo do jogo se o livro estiver fechado
if (!instance_exists(obj_spellbook) || !obj_spellbook.abrir) {
    draw_self();
}