
init()
{
	Precache();
    mapEdits();
	level thread itemRotation();
	level.weapon_angles = 0;
}

Precache()
{
	PrecacheModel("t6_wpn_supply_drop_ally");
}

mapEdits()
{
	//if were going to extend the number of maps supported we might want to look into using feds gsc utils since it has an openfile function
	//we could use it to easily store and process data in a text file at the downside of the mod only working on servers
	//just something to consider
	if(getDvar("mapname") == "mp_drone")
	{
		boxes = [];
		/*
		//SDC Spawn Door
		boxes[0] = spawn("script_model", (-1863.98, -986, 115));
    	boxes[0].angles = (0, 90, 0);
		
		boxes[1] = spawn("script_model", (-1863.98, -986, 150));
    	boxes[1].angles = (0, 90, 0);

		boxes[2] = spawn("script_model", (-1863.98, -986, 185));
    	boxes[2].angles = (0, 90, 0);

		//Factory Window SDC Side
		boxes[3] = spawn("script_model", (-860, -245, 315));
    	boxes[3].angles = (0, 90, 0);

		boxes[4] = spawn("script_model", (-770, -245, 315));
    	boxes[4].angles = (0, 90, 0);

		boxes[5] = spawn("script_model", (-860, -245, 345));
    	boxes[5].angles = (0, 90, 0);

		boxes[6] = spawn("script_model", (-770, -245, 345));
    	boxes[6].angles = (0, 90, 0);

		boxes[7] = spawn("script_model", (-860, -245, 375));
    	boxes[7].angles = (0, 90, 0);

		boxes[8] = spawn("script_model", (-770, -245, 375));
    	boxes[8].angles = (0, 90, 0);

		//Factory Window SEALS Side
		boxes[9] = spawn("script_model", (-860, 620, 315));
    	boxes[9].angles = (0, 90, 0);

		boxes[10] = spawn("script_model", (-770, 620, 315));
    	boxes[10].angles = (0, 90, 0);

		boxes[11] = spawn("script_model", (-860, 620, 345));
    	boxes[11].angles = (0, 90, 0);

		boxes[12] = spawn("script_model", (-770, 620, 345));
    	boxes[12].angles = (0, 90, 0);

		boxes[13] = spawn("script_model", (-860, 620, 375));
    	boxes[13].angles = (0, 90, 0);

		boxes[14] = spawn("script_model", (-770, 620, 375));
    	boxes[14].angles = (0, 90, 0);

		//Factory Stairs Blockage
		boxes[15] = spawn("script_model", (-747, -180, 280));
    	boxes[15].angles = (0, 180, 0);

		boxes[16] = spawn("script_model", (-747, -100, 280));
    	boxes[16].angles = (0, 180, 0);

		boxes[17] = spawn("script_model", (-747, -20, 280));
    	boxes[17].angles = (0, 180, 0);

		boxes[18] = spawn("script_model", (-747, 60, 280));
    	boxes[18].angles = (0, 180, 0);

		boxes[19] = spawn("script_model", (-747, 140, 280));
    	boxes[19].angles = (0, 180, 0);

		boxes[20] = spawn("script_model", (-747, 220, 280));
    	boxes[20].angles = (0, 180, 0);

		boxes[21] = spawn("script_model", (-747, 300, 280));
    	boxes[21].angles = (0, 180, 0);

		boxes[22] = spawn("script_model", (-747, 380, 280));
    	boxes[22].angles = (0, 180, 0);

		boxes[23] = spawn("script_model", (-747, 460, 280));
    	boxes[23].angles = (0, 180, 0);

		boxes[24] = spawn("script_model", (-747, 540, 280));
    	boxes[24].angles = (0, 180, 0);

		boxes[25] = spawn("script_model", (-766, 595, 280));
    	boxes[25].angles = (0, 90, 0);

		boxes[26] = spawn("script_model", (-747, -180, 310));
    	boxes[26].angles = (0, 180, 0);

		boxes[27] = spawn("script_model", (-747, -100, 310));
    	boxes[27].angles = (0, 180, 0);

		boxes[28] = spawn("script_model", (-747, -20, 310));
    	boxes[28].angles = (0, 180, 0);

		boxes[29] = spawn("script_model", (-747, 60, 310));
    	boxes[29].angles = (0, 180, 0);

		boxes[30] = spawn("script_model", (-747, 140, 310));
    	boxes[30].angles = (0, 180, 0);

		boxes[31] = spawn("script_model", (-747, 220, 310));
    	boxes[31].angles = (0, 180, 0);

		boxes[32] = spawn("script_model", (-747, 300, 310));
    	boxes[32].angles = (0, 180, 0);

		boxes[33] = spawn("script_model", (-747, 380, 310));
    	boxes[33].angles = (0, 180, 0);

		boxes[34] = spawn("script_model", (-747, 460, 310));
    	boxes[34].angles = (0, 180, 0);

		boxes[35] = spawn("script_model", (-747, 540, 310));
    	boxes[35].angles = (0, 180, 0);

		boxes[36] = spawn("script_model", (-766, 595, 310));
    	boxes[36].angles = (0, 90, 0);

		//Right of SDC Top Door
		boxes[37] = spawn("script_model", (197, -1124, 243));
    	boxes[37].angles = (0, 0, 0);

		boxes[38] = spawn("script_model", (197, -1124, 273));
    	boxes[38].angles = (0, 0, 0);

		boxes[39] = spawn("script_model", (197, -1124, 303));
    	boxes[39].angles = (0, 0, 0);

		boxes[40] = spawn("script_model", (197, -1124, 333));
    	boxes[40].angles = (0, 0, 0);

		//SEALS Factory Entrance
		boxes[41] = spawn("script_model", (-807, 1317, 150));
    	boxes[41].angles = (0, 90, 0);

		boxes[42] = spawn("script_model", (-887, 1317, 150));
    	boxes[42].angles = (0, 90, 0);

		boxes[43] = spawn("script_model", (-967, 1317, 150));
    	boxes[43].angles = (0, 90, 0);

		boxes[44] = spawn("script_model", (-807, 1317, 185));
    	boxes[44].angles = (0, 90, 0);

		boxes[45] = spawn("script_model", (-887, 1317, 185));
    	boxes[45].angles = (0, 90, 0);

		boxes[46] = spawn("script_model", (-967, 1317, 185));
    	boxes[46].angles = (0, 90, 0);

		//Tower Room Block
		boxes[47] = spawn("script_model", (884, -493, 80));
    	boxes[47].angles = (0, 90, 0);

		boxes[48] = spawn("script_model", (884, -493, 110));
    	boxes[48].angles = (0, 90, 0);

		boxes[49] = spawn("script_model", (884, -493, 140));
    	boxes[49].angles = (0, 90, 0);

		//Factory Stairs Blockage Addition - accidentally skipped it
		boxes[50] = spawn("script_model", (-747, -180, 340));
    	boxes[50].angles = (0, 180, 0);

		boxes[51] = spawn("script_model", (-747, -100, 340));
    	boxes[51].angles = (0, 180, 0);

		boxes[52] = spawn("script_model", (-747, -20, 340));
    	boxes[52].angles = (0, 180, 0);

		boxes[53] = spawn("script_model", (-747, 60, 340));
    	boxes[53].angles = (0, 180, 0);

		boxes[54] = spawn("script_model", (-747, 140, 340));
    	boxes[54].angles = (0, 180, 0);

		boxes[55] = spawn("script_model", (-747, 220, 340));
    	boxes[55].angles = (0, 180, 0);

		boxes[56] = spawn("script_model", (-747, 300, 340));
    	boxes[56].angles = (0, 180, 0);

		boxes[57] = spawn("script_model", (-747, 380, 340));
    	boxes[57].angles = (0, 180, 0);

		boxes[58] = spawn("script_model", (-747, 460, 340));
    	boxes[58].angles = (0, 180, 0);

		boxes[59] = spawn("script_model", (-747, 540, 340));
    	boxes[59].angles = (0, 180, 0);

		boxes[60] = spawn("script_model", (-766, 595, 340));
    	boxes[60].angles = (0, 90, 0);

		//Balcony
		boxes[61] = spawn("script_model", (-330, 493, 220));
    	boxes[61].angles = (0, 90, 0);

		boxes[62] = spawn("script_model", (-330, 453, 220));
    	boxes[62].angles = (0, 90, 0);

		boxes[63] = spawn("script_model", (-330, 413, 220));
    	boxes[63].angles = (0, 90, 0);

		boxes[64] = spawn("script_model", (-330, 373, 220));
    	boxes[64].angles = (0, 90, 0);

		boxes[65] = spawn("script_model", (-330, 333, 220));
    	boxes[65].angles = (0, 90, 0);

		boxes[66] = spawn("script_model", (-330, 293, 220));
    	boxes[66].angles = (0, 90, 0);

		boxes[67] = spawn("script_model", (-330, 253, 220));
    	boxes[67].angles = (0, 90, 0);

		boxes[68] = spawn("script_model", (-330, 213, 220));
    	boxes[68].angles = (0, 90, 0);

		boxes[69] = spawn("script_model", (-330, 173, 220));
    	boxes[69].angles = (0, 90, 0);

		boxes[70] = spawn("script_model", (-330, 133, 220));
    	boxes[70].angles = (0, 90, 0);

		boxes[71] = spawn("script_model", (-330, 93, 220));
    	boxes[71].angles = (0, 90, 0);

		boxes[72] = spawn("script_model", (-330, 53, 220));
    	boxes[72].angles = (0, 90, 0);

		boxes[73] = spawn("script_model", (-330, 13, 220));
    	boxes[73].angles = (0, 90, 0);

		boxes[74] = spawn("script_model", (-330, -27, 220));
    	boxes[74].angles = (0, 90, 0);

		boxes[75] = spawn("script_model", (-330, -67, 220));
    	boxes[75].angles = (0, 90, 0);

		boxes[76] = spawn("script_model", (-265, 493, 220));
    	boxes[76].angles = (0, 90, 0);

		boxes[77] = spawn("script_model", (-265, 453, 220));
    	boxes[77].angles = (0, 90, 0);

		boxes[78] = spawn("script_model", (-265, 413, 220));
    	boxes[78].angles = (0, 90, 0);

		boxes[79] = spawn("script_model", (-265, 373, 220));
    	boxes[79].angles = (0, 90, 0);

		boxes[80] = spawn("script_model", (-265, 333, 220));
    	boxes[80].angles = (0, 90, 0);

		boxes[81] = spawn("script_model", (-265, 293, 220));
    	boxes[81].angles = (0, 90, 0);

		boxes[82] = spawn("script_model", (-265, 253, 220));
    	boxes[82].angles = (0, 90, 0);

		boxes[83] = spawn("script_model", (-265, 213, 220));
    	boxes[83].angles = (0, 90, 0);

		boxes[84] = spawn("script_model", (-265, 173, 220));
    	boxes[84].angles = (0, 90, 0);

		boxes[85] = spawn("script_model", (-265, 133, 220));
    	boxes[85].angles = (0, 90, 0);

		boxes[86] = spawn("script_model", (-265, 93, 220));
    	boxes[86].angles = (0, 90, 0);

		boxes[87] = spawn("script_model", (-265, 53, 220));
    	boxes[87].angles = (0, 90, 0);

		boxes[88] = spawn("script_model", (-265, 13, 220));
    	boxes[88].angles = (0, 90, 0);

		boxes[89] = spawn("script_model", (-265, -27, 220));
    	boxes[89].angles = (0, 90, 0);

		boxes[90] = spawn("script_model", (-265, -67, 220));
    	boxes[90].angles = (0, 90, 0);

		for(i = 0; i < boxes.size; i++)
		{
			boxes[i] setModel("t6_wpn_supply_drop_ally");
		}
		*/
		spawn_item_wrapper( "consumable", "health_pack", (901,-133,56), "p_glo_scavenger_pack_obj" ); //SDC Right Mid
		spawn_item_wrapper( "consumable", "health_pack", (78,1948,176), "p_glo_scavenger_pack_obj" ); //SEALS Spawn
		spawn_item_wrapper( "consumable", "health_pack", (-381,-864,36), "p_glo_scavenger_pack_obj" ); //SDC Spawn
		spawn_item_wrapper( "consumable", "health_pack", (-315,251,64), "p_glo_scavenger_pack_obj" ); //Under Balcony Mid
		spawn_item_wrapper( "ammo", "machinegun_ammo", (-375,-575,78), "t6_attach_mag_type05_lmg_world" ); //SDC Beside Vent
		spawn_item_wrapper( "ammo", "machinegun_ammo", (298,798,149), "t6_attach_mag_type05_lmg_world" ); //SEALS Stairway to Mid
		spawn_item_wrapper( "ammo", "machinegun_ammo", (253,-210,50), "t6_attach_mag_type05_lmg_world" ); //SDC Stairway to Mid
		spawn_item_wrapper( "ammo", "machinegun_ammo", (-60,913,278), "t6_attach_mag_type05_lmg_world" ); //SEALS Catwalk
		spawn_item_wrapper( "ammo", "railgun_ammo", (46,-905,-12), "t5_veh_rcbomb_gib_battery" ); //Underpass
		spawn_item_wrapper( "ammo", "railgun_ammo", (-68,-1103,-10), "t5_veh_rcbomb_gib_battery" ); //Underpass
		spawn_item_wrapper( "ammo", "railgun_ammo", (-900,830,290), "t5_veh_rcbomb_gib_battery" ); //SEALS factory side
		spawn_item_wrapper( "ammo", "railgun_ammo", (-990,-843,285), "t5_veh_rcbomb_gib_battery" ); //SDC Stairs
		spawn_item_wrapper( "ammo", "railgun_ammo", (-90,-568,196), "t5_veh_rcbomb_gib_battery" ); //Heli Pad vents
		spawn_item_wrapper( "ammo", "railgun_ammo", (756,925,280), "t5_veh_rcbomb_gib_battery" ); //Snipernest Left
		spawn_item_wrapper( "ammo", "shotgun_ammo", (1180,1094,70), "p_glo_scavenger_pack" ); //Far left mid between boilers?
		spawn_item_wrapper( "ammo", "shotgun_ammo", (1180,1261,70), "p_glo_scavenger_pack" ); //Far left mid between boilers?
		spawn_item_wrapper( "ammo", "shotgun_ammo", (139,251,135), "p_glo_scavenger_pack" ); //Shotgun Mid Car
		spawn_item_wrapper( "ammo", "shotgun_ammo", (-1284,-2243,100), "p_glo_scavenger_pack" ); //Shotgun ammo SDC Spawn
		spawn_item_wrapper( "ammo", "rocket_ammo", (109,-1000,263), "t6_wpn_projectile_rpg7" ); //RPG ammo Helipad
		spawn_item_wrapper( "ammo", "rocket_ammo", (109,-940,263), "t6_wpn_projectile_rpg7" ); //RPG ammo Helipad
		spawn_item_wrapper( "ammo", "rocket_ammo", (-285,130,272), "t6_wpn_projectile_rpg7" ); //RPG ammo Balcony
		spawn_item_wrapper( "ammo", "rocket_ammo", (-285,250,272), "t6_wpn_projectile_rpg7" ); //RPG ammo Balcony
		spawn_item_wrapper( "weapon", "rocket_launcher", (670,110,50), "usrpg_mp" ); //SEALS Left Mid
		spawn_item_wrapper( "weapon", "rocket_launcher", (-285,192,272), "usrpg_mp" ); //Balcony Mid
		spawn_item_wrapper( "weapon", "shotgun", (1179,1182,75), "ksg_mp" ); //Far SEALS left mid between boilers?
		spawn_item_wrapper( "weapon", "shotgun", (-1301,-2324,100), "ksg_mp" ); //SDC Spawn
		spawn_item_wrapper( "weapon", "railgun", (851,3000,373), "ballista_mp" ); //SEALS Spawn
		spawn_item_wrapper( "weapon", "railgun", (677,925,286), "ballista_mp" ); //Snipernest SEALS Left
		spawn_item_wrapper( "weapon", "railgun", (-990,-1036,300), "ballista_mp" ); //SDC Stairs
		spawn_item_wrapper( "weapon", "railgun", (-49,-998,-5), "ballista_mp" ); //Underpass SDC right
	}
}

spawn_item_wrapper( item_category, item_type, origin, model  )
{
	switch ( item_category )
	{
		case "weapon":
			spawn_weapon( model, item_type, origin );
			break;
		case "ammo":
			switch ( item_type )
			{
				case "machinegun_ammo":
					weapon = "tar21_mp";
					break;
				case "rocket_ammo":
					weapon = "usrpg_mp";
					break;
				case "railgun_ammo":
					weapon = "ballista_mp";
					break;
				case "shotgun_ammo":
					weapon = "ksg_mp";
					break;
				default: 
					break;
			}
			spawn_ammo( model, weapon, origin );
			break;
		case "consumable":
			spawn_consumable( model, item_type, origin );
			break;
		default:
			break;
	}
}

spawn_weapon( model, item_type, origin )
{
	weapon_model = getWeaponModel( model );
    if ( weapon_model == "" )
	{
		weapon_model = model;
	}
    weapon = spawn( "script_model", origin );
    weapon setModel( model );
	weapon.weapon_name = model;
	weapon thread watch_for_weapon_pickup();
	weapon thread rotate_angles();
}

spawn_ammo( model, weapon, origin )
{
	ammo = spawn( "script_model", origin );
	ammo setModel( model );
	ammo.ammo_type = weapon;
	ammo thread watch_for_ammo_pickup();
	ammo thread rotate_angles();
}

spawn_consumable( model, item_type, origin )
{
	consumable = spawn( "script_model", origin );
	consumable setModel( model );
	consumable.item_type = item_type;
	consumable thread watch_for_consumable_pickup(); 
	consumable thread rotate_angles();
}

watch_for_weapon_pickup()
{
	trigger = spawn( "trigger_radius", self.origin, 0, 84, 72 );
	while ( true )
	{
		trigger waittill( "trigger", player );
		if ( isplayer( player ) )
		{
			player giveWeapon( self.weapon_name );
			player IPrintLn( "^3" + self.weapon_name + "^7 Acquired" );
			self hide();
			wait 5;
			self show();
		}
	}
}

watch_for_ammo_pickup()
{
	trigger = spawn( "trigger_radius", self.origin, 0, 84, 72 );
	while ( true )
	{
		trigger waittill( "trigger", player );
		if ( isplayer( player ) )
		{
			player giveMaxAmmo( self.ammo_type );
			self hide();
			wait 5;
			self show();
		}
	}
}

watch_for_consumable_pickup()
{
	trigger = spawn( "trigger_radius", self.origin, 0, 84, 72 );
	while ( true )
	{
		trigger waittill( "trigger", player );
		if ( isplayer( player ) )
		{
			self hide();
			switch ( self.item_type )
			{
				case "health_pack":
					player.health += 25;
					wait 5;
					break;
				case "armor_pack":
					player.current_armor += 25;
					wait 10;
					break;
				default:
					logline1 = "Invalid pickup attempt " + self.item_type + " has has not been registered as a valid pickup." + "\n";
					logprint( logline1 );
					break;
			}
			self show();
		}
	}
}

rotate_angles()
{
	while ( true )
	{
		self.angles = level.weapon_angles;
		wait 0.05;
	}
}

itemRotation()
{
	i = 0;
	while ( true )
	{
		level.weapon_angles = (-60, 24 * i ,0);
		if ( i == 15 )
		{
			i = 0;
		}
		i++;
		wait 0.05;
	}
}