var _tiro = instance_create_layer(
    x + lengthdir_x(14, facing),
    y + lengthdir_y(14, facing),
     "instances",
     obj_cd
)

_tiro.direcao = facing;
_tiro.image_angle = facing;