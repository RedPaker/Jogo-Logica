var _nome = nomes[$ room_get_name(room)];

// casa ou interior: não mostra e não mexe no último local
// (assim, ao sair da casa para a mesma vila, o nome não repete)
if (_nome == undefined) exit;

if (_nome != global.ultimo_local) {
    texto = _nome;
    estado = 0;
    anim = 0;
    espera = 120;
    ativo = true;
}
global.ultimo_local = _nome;