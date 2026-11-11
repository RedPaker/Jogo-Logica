// 1. Criar o sistema e desativar o desenho automático (você controla o desenho)
global.particles = part_system_create();
part_system_automatic_draw(global.particles, false); 

global.partTypeConfetti = part_type_create();
part_type_shape(global.partTypeConfetti, pt_shape_square);

// 2. AJUSTE DE TAMANHO: Deixando os confetes grandes e visíveis na GUI
part_type_size(global.partTypeConfetti, 0.20, 0.45, 0, 0); // Valores aumentados para pedaços grandes
part_type_scale(global.partTypeConfetti, 1, 0.6);         // Formato retangular proporcional

// 3. Cores vibrantes aleatórias
part_type_color3(global.partTypeConfetti, c_red, c_yellow, c_lime);

// 4. EXPLOSÃO PARA A TELA TODA: Velocidade e impulsos maiores
part_type_speed(global.partTypeConfetti, 8, 18, -0.15, 0); // Dispara rápido e desacelera flutuando
part_type_direction(global.partTypeConfetti, 0, 360, 0, 0); // Atira para todas as direções (360º)
part_type_gravity(global.partTypeConfetti, 0.22, 270);     // Gravidade ajustada para caírem elegante
part_type_orientation(global.partTypeConfetti, 0, 360, 8, 0, false); // Gira mais rápido no ar

// 5. Tempo de vida longo para cruzar a tela de cima a baixo
part_type_life(global.partTypeConfetti, 150, 240);
