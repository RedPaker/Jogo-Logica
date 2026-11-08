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
