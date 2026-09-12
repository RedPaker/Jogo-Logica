var _hor = clamp(alvo_x - x, -2, 1);
var _ver = clamp(alvo_y - y, -2, 1);

move_and_collide(_hor * move_spd, _ver * move_spd, [tilemap_foreground, obj_enemy_parent, obj_plr_rpg]);
