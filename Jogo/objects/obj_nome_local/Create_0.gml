persistent = true;
depth = -16000;

// evita duplicar ao voltar para a room inicial
if (instance_number(obj_nome_local) > 1) { instance_destroy(); exit; }

if (!variable_global_exists("ultimo_local")) global.ultimo_local = "";

// room -> nome mostrado. Rooms fora da lista (casas, interiores) não mostram nada.
nomes = {};
nomes[$ "rm_ilha"]   = "Ilha bit";
nomes[$ "rm_fase_1"]  = "Vila byte";
nomes[$ "rm_floresta"] = "Floresta de Dados";

ativo = false;
texto = "";
estado = 0;      // 0 = descendo, 1 = parado, 2 = subindo
anim = 0;        // 0 a 1
espera = 0;