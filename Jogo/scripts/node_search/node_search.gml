function find_node_by_name(_current_node, _search) {
    if (flexpanel_node_get_name(_current_node) == _search) {
        return _current_node;
    }
    
    var _total_children = flexpanel_node_get_num_children(_current_node);
    for (var _i = 0; _i < _total_children; _i++) {
        var _child = flexpanel_node_get_child(_current_node, _i);
        var _result = find_node_by_name(_child, _search);
        
        // Se encontrou em algum sub-painel, retorna ele
        if (_result != noone) {
            return _result;
        }
    }
    
    return noone; // Retorna noone caso não ache nada neste galho
}