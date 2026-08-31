var _hor = clamp(alvo_x - x, -1, 1);
var _ver = clamp(alvo_y - y, -1, 1);

// Direção em que o inimigo está andando
if (_hor != 0)
{
    dir_x = sign(_hor);
    dir_y = 0;
}
else if (_ver != 0)
{
    dir_x = 0;
    dir_y = sign(_ver);
}

// Recuo
if (recuando)
{
    x += rc_x * 4;
    y += rc_y * 4;

    rc_x = lerp(rc_x, 0, 0.2);
    rc_y = lerp(rc_y, 0, 0.2);

    if (abs(rc_x) < 0.1 && abs(rc_y) < 0.1)
    {
        rc_x = 0;
        rc_y = 0;
        recuando = false;
    }
}


move_and_collide( _hor * move_spd, _ver * move_spd, [tilemap_foreground, obj_enemy_parent, obj_plr_rpg] );


if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < distance_to_player)
{
    alvo_x = obj_plr_rpg.x;
    alvo_y = obj_plr_rpg.y;
}
else
{
    alvo_x = random_range(xstart - 50, xstart + 100);
    alvo_y = random_range(ystart - 50, ystart + 100);
}

