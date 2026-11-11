// Verifica se a tecla X foi pressionada
if (keyboard_check_pressed(ord("M"))) {
    
    // Repete o código 50 vezes para criar 50 confetes espalhados
    repeat(50) {
        // Sorteia uma posição X e Y qualquer dentro da tela do jogo
        var random_x = random(room_width);
        var random_y = random(room_height);
        
        // Cria 1 confete naquela posição sorteada
        part_particles_create(global.particles, random_x, random_y, global.partTypeConfetti, 1);
    }
}
