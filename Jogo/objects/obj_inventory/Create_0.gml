abrir = false;
global.inv_aberto = false;

categoria = 0;
inv_teclado = 0;
inv_selecionado = -1;

if (!variable_global_exists("inv")) global.inv = [];

global.feiticos = [
    {
        name: "Disparo de CD",
        description: "Lança um CD na direção em que o jogador está olhando."
    },
    {
        name: "Choque",
        description: "Libera uma descarga elétrica ao redor do jogador."
    },
    {
        name: "Jukebox",
        description: "Cria uma explosão musical para atingir os inimigos."
    },
    {
        name: "Vento",
        description: "Libera uma rajada de vento à frente do jogador."
    },
    {
        name: "Cura",
        description: "Recupera 30 pontos de vida após o tempo de canalização."
    },
    {
        name: "Flash",
        description: "Libera um clarão que atinge os inimigos próximos."
    },
    {
        name: "Overheat",
        description: "Libera uma explosão de calor ao redor do jogador."
    }
];