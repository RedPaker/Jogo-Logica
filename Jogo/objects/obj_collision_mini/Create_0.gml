depth = -95; // Fica na frente do bloco maior (-90)

bloco_mae = noone;       // Instância do bloco maior ao qual pertence
sub_linha = 0;          // Índice de 0 a 4 (da esquerda para a direita)
bloco_encaixado = noone; // Instância do bloquinho_menor que foi solto aqui
offset_pai_x = 0;       // Distância em X relativa ao centro/origem do bloco pai
offset_pai_y = 0;

tipo_aceito = "TODOS";   // Define se este slot só aceita tipos específicos ("NUMERO", "TEXTO", etc.)