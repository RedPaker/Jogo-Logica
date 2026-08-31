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

alarm[0] = 60;