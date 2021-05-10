//see if it displays intro or death screen, depending of the existance of the player
if(instance_exists(o_player)) sprite_index=s_death;
else sprite_index=s_introanimationEN;