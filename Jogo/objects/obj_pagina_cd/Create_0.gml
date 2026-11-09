event_inherited();

// numero_pagina (1 a 5) e definido nas "Variable Definitions" do objeto
// ou na instancia colocada na sala. O livro usa o indice a partir de 0.
indice_pagina = numero_pagina - 1;

// Se essa pagina ja esta no inventario (ex.: voltou para a sala), some.
if (pagina_coletada(indice_pagina)) {
    instance_destroy();
}
