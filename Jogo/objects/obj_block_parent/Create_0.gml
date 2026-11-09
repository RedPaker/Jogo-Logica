is_pressed = false;
depth = -100;
arrastando = false;
offset_x = 0;
offset_y = 0;
image_xscale = 2.8;
image_yscale = 2.8;
primeira = false;
aumenta = false;
offset_inventario_x = 180;
offset_inventario_y = 0;
valor_conferencia = 0
send = false
no_block_valid = false
encaixado = false
accept_all = false
criou_rabinho = false;
rabinho_instancia = noone;
encontrou = false
blk = noone
saiu = false
e_while = false
amarz = 0
y_bloco = 50
criou_rabinho_if = false;
rabinho_instancia_if = noone;
encontrou = false;
blk_if = noone;
saiu = false;
e_if = false;
amarz_if = 0;
y_bloco_if = 50;
qt_if = 1;
criou_rabinho_if = false;
rabinho_instancia_if = noone;
encontrou = false;
blk_if = noone;
saiu = false;
e_if = false;
amarz_if = 0;
y_bloco_if = 50;
qt_if = 1;


// =====================================================================
//  WHILE / IF: corpo, cauda e blocos de dentro
// ---------------------------------------------------------------------
//  - Cada WHILE/IF é dono da sua própria cauda (variável "cauda").
//  - Um bloco solto na linha do WHILE/IF entra no fim do corpo.
//  - Ao tirar o WHILE/IF da área de código, tudo o que estava dentro
//    volta para a página da direita e a cauda some.
//  - Ao mudar o WHILE/IF de linha, os blocos de dentro vão junto.
// =====================================================================
minha_linha = -1;        // linha (slot) onde este bloco está; -1 = fora da área de código
linha_estrutura = -1;    // (WHILE/IF) linha onde a estrutura está
cauda = noone;           // (WHILE/IF) instância da cauda
itens_dentro = [];       // (WHILE/IF) blocos guardados enquanto a estrutura é arrastada
guardou_filhos = false;
estava_no_codigo = false;

posicao_livro = function() {
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);

    x = (_centro_x + offset_inventario_x) + _cam_x;
    y = (_centro_y + offset_inventario_y) + _cam_y;
};

e_cauda = function() {
    return object_index == obj_bloco_while_rabo || object_index == obj_bloco_if_rabo;
}

// Em qual linha da área de código este bloco está (-1 = nenhuma)
linha_do_slot = function() {
    var _slot = instance_place(x, y, obj_colission_bl);
    return (_slot != noone) ? _slot.linha : -1;
}

// Devolve o slot (obj_colission_bl) de uma linha, ou noone
slot_da_linha = function(_linha) {
    var _achou = noone;
    with (obj_colission_bl) {
        if (linha == _linha) _achou = id;
    }
    return _achou;
}

// ---------- Entrar no corpo ----------
// Última linha ocupada da área de código (blocos grandes e caudas), sem contar _ignorar
ultima_linha_ocupada = function(_ignorar) {
    var _ultima = -1;
    with (obj_block_parent) {
        if (id == _ignorar) continue;
        if (e_cauda()) {
            _ultima = max(_ultima, linha_do_slot());
        } else if (encaixado && !arrastando) {
            _ultima = max(_ultima, minha_linha);
        }
    }
    return _ultima;
}

// "Insere uma linha": tudo o que está da linha _linha para baixo desce uma linha.
// As caudas não são movidas aqui: cada WHILE/IF reposiciona a sua sozinho.
abrir_linha = function(_linha, _quem_entra) {
    with (obj_block_parent) {
        if (id != _quem_entra && encaixado && !arrastando && !e_cauda()
            && minha_linha >= _linha) {
            y += 50;
            minha_linha += 1;
        }
    }
    with (obj_mini_parent) {
        if (!arrastando) {
            var _s = instance_place(x, y, obj_colission_mini);
            if (_s != noone && _s.linha >= _linha) {
                y += 50;
            }
        }
    }
}

// ---------- Soltar em cima de outro bloco ----------
e_estrutura = function() {
    return object_index == obj_bloco_while || object_index == obj_bloco_if;
}

// Chamado quando o bloco é solto num slot da área de código.
// - Se a linha já tem outro bloco grande (ou uma cauda), este bloco vai para a linha de baixo.
// - Se a linha é de um WHILE/IF, não faz nada: o bloco entra no corpo (verificar_bloco_*).
// - Abre espaço empurrando para baixo o que estiver no caminho. Um WHILE/IF precisa de
//   várias linhas livres: ele, o corpo e a cauda.
// - Se a inserção cai dentro do corpo de um WHILE/IF, o corpo cresce e o bloco passa a fazer parte dele.
// - Se não houver espaço no livro, o bloco volta pro inventário.
posicionar_ao_soltar = function() {
    if (e_cauda()) return;
    var _l = linha_do_slot();
    if (_l == -1) return;

    var _na = function(_lista, _v) {
        for (var i = 0; i < array_length(_lista); i++) if (_lista[i] == _v) return true;
        return false;
    };
    // não contam como "outros": ele mesmo e, se for WHILE/IF, o que ele está carregando
    var _excluir = [id];
    if (e_estrutura()) {
        for (var i = 0; i < array_length(itens_dentro); i++) array_push(_excluir, itens_dentro[i]);
    }

    // quem está na linha onde ele foi solto?
    var _ocupada = false;
    var _ocupante_estrutura = false;
    with (obj_block_parent) {
        if (_na(_excluir, id)) continue;
        var _ln = e_cauda() ? linha_do_slot() : ((encaixado && !arrastando) ? linha_do_slot() : -1);
        if (_ln == _l) {
            _ocupada = true;
            if (e_estrutura()) _ocupante_estrutura = true;
        }
    }
    if (_ocupante_estrutura) return;

    var _p = _ocupada ? _l + 1 : _l;      // linha onde ele vai ficar
    var _n = 1;                           // quantas linhas ele precisa
    if (e_estrutura()) _n = variable_instance_get(id, (object_index == obj_bloco_while) ? "qt" : "qt_if") + 1;

    // primeira linha ocupada (por outros) a partir de _p e última linha ocupada
    var _k = 999;
    var _ultima = -1;
    with (obj_block_parent) {
        if (_na(_excluir, id)) continue;
        var _ln = e_cauda() ? linha_do_slot() : ((encaixado && !arrastando) ? linha_do_slot() : -1);
        if (_ln == -1) continue;
        if (_ln >= _p) _k = min(_k, _ln);
        _ultima = max(_ultima, _ln);
    }
    var _desloc = (_k < _p + _n) ? (_p + _n - _k) : 0;

    // cabe no livro?
    if (slot_da_linha(_p + _n - 1) == noone || (_desloc > 0 && slot_da_linha(_ultima + _desloc) == noone)) {
        posicao_livro();
        encaixado = false;
        minha_linha = -1;
        return;
    }

    if (_desloc > 0) {
        // WHILE/IF cujo corpo contém a linha de inserção crescem
        var _w_dentro = noone;
        var _i_dentro = noone;
        with (obj_bloco_while) {
            if (!_na(_excluir, id) && encaixado && !arrastando) {
                var _lw = linha_do_slot();
                if (_lw < _p && _p <= _lw + qt) { qt += _desloc; _w_dentro = id; }
            }
        }
        with (obj_bloco_if) {
            if (!_na(_excluir, id) && encaixado && !arrastando) {
                var _li = linha_do_slot();
                if (_li < _p && _p <= _li + qt_if) { qt_if += _desloc; _i_dentro = id; }
            }
        }
        if (_w_dentro != noone && blk == noone) blk = _w_dentro;
        if (_i_dentro != noone && blk_if == noone) blk_if = _i_dentro;

        // empurra para baixo tudo o que está da linha _p em diante
        with (obj_block_parent) {
            if (!_na(_excluir, id) && encaixado && !arrastando && !e_cauda()) {
                var _ln = linha_do_slot();
                if (_ln >= _p) { y += _desloc * 50; minha_linha = _ln + _desloc; }
            }
        }
        with (obj_mini_parent) {
            if (!_na(_excluir, id) && !arrastando) {
                var _s = instance_place(x, y, obj_colission_mini);
                if (_s != noone && _s.linha >= _p) y += _desloc * 50;
            }
        }
    }

    if (_p != _l) {
        var _slot = slot_da_linha(_p);
        x = _slot.x;
        y = _slot.y;
    }
    minha_linha = _p;
}

// _estrutura: o WHILE/IF em que o bloco foi solto | _var_qt: "qt" ou "qt_if"
entrar_na_estrutura = function(_estrutura, _var_qt) {
    var _qt = variable_instance_get(_estrutura, _var_qt);
    var _linha_insercao = _estrutura.linha_do_slot() + _qt; // onde a cauda está agora

    // Não tem espaço no livro para empurrar tudo uma linha para baixo: volta pro inventário
    if (slot_da_linha(ultima_linha_ocupada(id) + 1) == noone) {
        posicao_livro();
        encaixado = false;
        return false;
    }

    // Abre espaço (desce o que está abaixo, inclusive outros WHILE/IF e suas caudas)
    abrir_linha(_linha_insercao, id);

    // Vai para onde estava a cauda (fim do corpo); a cauda desce uma linha
    y += _qt * 50;
    variable_instance_set(_estrutura, _var_qt, _qt + 1);
    minha_linha = linha_do_slot();
    return true;
}

// =====================================================================
//  CLIQUE: só um bloco é pego por clique
// =====================================================================
// Verdadeiro se o mouse está em cima deste bloco (e o bloco está visível)
sob_mouse = function() {
    if (!visible) return false;
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _gx = x - camera_get_view_x(view_camera[0]);
    var _gy = y - camera_get_view_y(view_camera[0]);
    var _hw = sprite_width / 2;
    var _hh = sprite_height / 2;
    return point_in_rectangle(_mx, _my, _gx - _hw, _gy - _hh, _gx + _hw, _gy + _hh);
}

// Quando há vários blocos sob o mouse, só um pode ser pego:
// os blocos pequenos têm prioridade (são desenhados por cima dos grandes) e,
// entre blocos do mesmo tipo, ganha o que tem o centro mais perto do mouse.
ganha_clique = function() {
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    var _eu = id;
    var _meu_x = x;
    var _meu_y = y;
    var _sou_mini = object_is_ancestor(object_index, obj_mini_parent);
    var _minha_dist = point_distance(_mx, _my, x - _cx, y - _cy);
    var _ganhou = true;

    with (obj_mini_parent) {
        if (id != _eu && sob_mouse()) {
            if (!_sou_mini) {
                _ganhou = false;
            } else {
                var _d = point_distance(_mx, _my, x - _cx, y - _cy);
                if (_d < _minha_dist || (_d == _minha_dist && (x < _meu_x || (x == _meu_x && y < _meu_y)))) {
                    _ganhou = false;
                }
            }
        }
    }
    if (_sou_mini || !_ganhou) return _ganhou;

    with (obj_block_parent) {
        if (id != _eu && !e_cauda() && sob_mouse()) {
            var _d = point_distance(_mx, _my, x - _cx, y - _cy);
            if (_d < _minha_dist || (_d == _minha_dist && (x < _meu_x || (x == _meu_x && y < _meu_y)))) {
                _ganhou = false;
            }
        }
    }
    return _ganhou;
}

verificar_bloco_while = function() {
    if (e_cauda() || blk != noone) return;
    var _w = instance_place(x, y, obj_bloco_while);
    if (_w == noone || !_w.encaixado || _w.arrastando) return;
    if (entrar_na_estrutura(_w, "qt")) blk = _w;
}

verificar_bloco_if = function() {
    if (e_cauda() || blk_if != noone) return;
    var _i = instance_place(x, y, obj_bloco_if);
    if (_i == noone || !_i.encaixado || _i.arrastando) return;
    if (entrar_na_estrutura(_i, "qt_if")) blk_if = _i;
}

// ---------- Sair do corpo ----------
// Fecha o "buraco" deixado na linha _linha: quem está abaixo (até _fim) sobe uma linha.
// Os blocos pequenos que estavam na linha do bloco que saiu voltam pro inventário.
fechar_buraco = function(_linha, _fim, _quem_saiu) {
    with (obj_block_parent) {
        if (id != _quem_saiu && encaixado && !arrastando && !e_cauda()
            && minha_linha > _linha && minha_linha <= _fim) {
            y -= 50;
            minha_linha -= 1;
        }
    }
    with (obj_mini_parent) {
        if (!arrastando) {
            var _s = instance_place(x, y, obj_colission_mini);
            if (_s != noone) {
                if (_s.linha == _linha) {
                    posicao_livro();
                } else if (_s.linha > _linha && _s.linha <= _fim) {
                    y -= 50;
                }
            }
        }
    }
}

sair_da_estrutura = function(_estrutura, _var_qt) {
    if (!instance_exists(_estrutura)) return;
    var _qt = variable_instance_get(_estrutura, _var_qt);
    if (minha_linha != -1) {
        fechar_buraco(minha_linha, _estrutura.linha_estrutura + _qt - 1, id);
    }
    variable_instance_set(_estrutura, _var_qt, max(1, _qt - 1));
}

saiu_do_while = function() {
    var _w = blk;
    blk = noone;
    sair_da_estrutura(_w, "qt");
}

saiu_do_if = function() {
    var _i = blk_if;
    blk_if = noone;
    sair_da_estrutura(_i, "qt_if");
}

// ---------- Usado só pelo WHILE/IF (chamado no End Step deles) ----------
// Junta os blocos que estão dentro: grandes nas linhas do corpo e
// pequenos na linha da estrutura (a condição) e nas linhas do corpo.
coletar_itens = function(_linha_ini, _linha_fim) {
    var _lista = [];
    var _eu = id;
    with (obj_block_parent) {
        if (id != _eu && encaixado && !arrastando && !e_cauda()
            && minha_linha > _linha_ini && minha_linha <= _linha_fim) {
            array_push(_lista, id);
        }
    }
    with (obj_mini_parent) {
        if (!arrastando) {
            var _s = instance_place(x, y, obj_colission_mini);
            if (_s != noone && _s.linha >= _linha_ini && _s.linha <= _linha_fim) {
                array_push(_lista, id);
            }
        }
    }
    return _lista;
}

devolver_itens = function(_lista, _var_blk) {
    for (var i = 0; i < array_length(_lista); i++) {
        var _b = _lista[i];
        if (!instance_exists(_b)) continue;
        with (_b) {
            posicao_livro();
            if (!object_is_ancestor(object_index, obj_mini_parent)) {
                encaixado = false;
                minha_linha = -1;
                variable_instance_set(id, _var_blk, noone); // já saiu junto, não precisa "fechar buraco"
            }
        }
    }
}

mover_itens = function(_lista, _delta_linhas) {
    for (var i = 0; i < array_length(_lista); i++) {
        var _b = _lista[i];
        if (!instance_exists(_b)) continue;
        with (_b) {
            y += _delta_linhas * 50;
            if (!object_is_ancestor(object_index, obj_mini_parent)) {
                minha_linha += _delta_linhas;
            }
        }
    }
}

apagar_cauda = function() {
    if (instance_exists(cauda)) instance_destroy(cauda);
    cauda = noone;
}

// _obj_cauda: obj_bloco_while_rabo / obj_bloco_if_rabo
// _var_qt: "qt" / "qt_if"   |   _var_blk: "blk" / "blk_if"
gerenciar_estrutura = function(_obj_cauda, _var_qt, _var_blk) {
    if (!(instance_exists(obj_spellbook) && obj_spellbook.abrir)) {
        apagar_cauda();
        return;
    }
    var _qt = variable_instance_get(id, _var_qt);

    // Sendo arrastado: esconde a cauda e lembra quem estava dentro
    if (arrastando) {
        apagar_cauda();
        if (estava_no_codigo && !guardou_filhos) {
            itens_dentro = coletar_itens(linha_estrutura, linha_estrutura + _qt - 1);
            guardou_filhos = true;
        }
        return;
    }

    // Acabou de ser solto depois de ter sido arrastado de dentro do código
    if (guardou_filhos) {
        guardou_filhos = false;
        if (!encaixado) {
            // Voltou pra página da direita: tudo de dentro volta junto
            devolver_itens(itens_dentro, _var_blk);
        } else {
            var _nova_linha = linha_do_slot();
            var _delta = _nova_linha - linha_estrutura;
            if (_delta != 0) {
                if (slot_da_linha(_nova_linha + _qt) == noone) {
                    // Não cabe no livro na linha nova: devolve o que estava dentro
                    devolver_itens(itens_dentro, _var_blk);
                    variable_instance_set(id, _var_qt, 1);
                    _qt = 1;
                } else {
                    mover_itens(itens_dentro, _delta);
                }
            }
        }
        itens_dentro = [];
    }

    // Fora da área de código: sem cauda e corpo vazio
    if (!encaixado) {
        apagar_cauda();
        variable_instance_set(id, _var_qt, 1);
        estava_no_codigo = false;
        linha_estrutura = -1;
        return;
    }

    // Na área de código: a cauda fica sempre na linha (estrutura + qt)
    linha_estrutura = linha_do_slot();
    estava_no_codigo = true;
    var _slot = slot_da_linha(linha_estrutura + _qt);
    if (_slot == noone) {
        apagar_cauda();
        return;
    }
    if (!instance_exists(cauda)) {
        cauda = instance_create_layer(_slot.x - 68, _slot.y, "Instances", _obj_cauda);
    }
    cauda.x = _slot.x - 68;
    cauda.y = _slot.y;
}
