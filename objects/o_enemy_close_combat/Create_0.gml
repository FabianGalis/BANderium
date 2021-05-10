event_inherited();
//spear enemy specific
spd=1.2;
life=20;
state=0;


//assign random sprite set
type=irandom(2);

switch (type)
	{
		case 0:
		s_idle=s_spear_blue_idle;
		s_alert=s_spear_blue_alert;
		s_walk_e=s_spear_blue_walk_e;
		s_attack_e=s_spear_blue_attack_e;
		s_walk_s=s_spear_blue_walk_s;
		s_attack_s=s_spear_blue_attack_s;
		s_walk_w=s_spear_blue_walk_w;
		s_attack_w=s_spear_blue_attack_w;
		s_walk_n=s_spear_blue_walk_n;
		s_attack_n=s_spear_blue_attack_n;
		s_dying_w=s_spear_blue_dying_w;
		s_dying_e=s_spear_blue_dying_e;
		break;
		case 1:
		s_idle=s_spear_green_idle;
		s_alert=s_spear_green_alert;
		s_walk_e=s_spear_green_walk_e;
		s_attack_e=s_spear_green_attack_e;
		s_walk_s=s_spear_green_walk_s;
		s_attack_s=s_spear_green_attack_s;
		s_walk_w=s_spear_green_walk_w;
		s_attack_w=s_spear_green_attack_w;
		s_walk_n=s_spear_green_walk_n;
		s_attack_n=s_spear_green_attack_n;
		s_dying_w=s_spear_green_dying_w;
		s_dying_e=s_spear_green_dying_e;
		break;
		case 2:
		s_idle=s_spear_yellow_idle;
		s_alert=s_spear_yellow_alert;
		s_walk_e=s_spear_yellow_walk_e;
		s_attack_e=s_spear_yellow_attack_e;
		s_walk_s=s_spear_yellow_walk_s;
		s_attack_s=s_spear_yellow_attack_s;
		s_walk_w=s_spear_yellow_walk_w;
		s_attack_w=s_spear_yellow_attack_w;
		s_walk_n=s_spear_yellow_walk_n;
		s_attack_n=s_spear_yellow_attack_n;
		s_dying_w=s_spear_yellow_dying_w;
		s_dying_e=s_spear_yellow_dying_e;
		break;
		case 3:
		break;
	}