#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_rank;

init()
{
	setDvar( "timescale", 1 );
	level.rocket_jump_damage_reduction = 0.666;
	level.armor_absorption = 0.666;
	SetDvar("jump_slowdownEnable", 0);
	SetDvar("g_speed", 320);
	SetDvar("friction", 6.0);
	SetDvar("perk_weapSpreadMultiplier", -100);
	SetDvar("perk_weapAdsMultiplier", 1000);
	level.onPlayerDamage = ::onplayerdamage();
	//Map Edits and Weapon and Item Pickups + Respawning
	level thread maps\mp\_ambientpackage::init();

	level.clientid = 0;
	level thread onplayerconnecting();
	level thread onplayerconnect();
}

onplayerconnect()
{
	level endon( "game_ended" );
	for ( ;; )
	{
		level waittill( "connected", player );
		player.max_armor = 100;
		player.current_armor = 1000;
		player thread hudStuff();
		player thread is_looking_at_ground();
		player thread onplayerspawned();
	}
}

onplayerconnecting()
{
	level endon( "game_ended" );
	for ( ;; )
	{
		level waittill("connecting", player );
		player.clientid = level.clientid;	
		level.clientid++;
	}
}

onplayerspawned()
{
	level endon("game_ended");
    self endon("disconnect");

	for(;;)
	{
		self waittill("spawned_player");
		self thread movementTech();
		self thread loadoutAdjustments();
		
		if ( !isDefined( isFirstSpawn ) )
		{
			//initOverFlowFix();
			isFirstSpawn = true;
		}
	}
}

movementTech()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "death" );
	
	//Debug
	//self FreezeControls(false);

	self AllowSprint(false);

	level.velMult = 0;

	self thread comboJumps();

	while ( true )
	{
		curVel = self GetVelocity();
		fSpeed = Floor((Sqrt(Pow(curVel[0], 2.0) + Pow(curVel[1], 2.0))));

		angles = self GetAngles();

		xForce = Cos(angles[1]) * (fspeed / 5) + (10 * self.velMult);
		zForce = Sin(angles[1]) * (fspeed / 5) + (10 * self.velMult);



		if(!self IsOnGround() && gainSpeed)
		{
			self setVelocity(self getVelocity() + (xForce, zForce, 0));
			gainSpeed = false;

			//DEBUG PRINTS

			//self IPrintLn("Force X: ^1" + xForce +"\nForce Z: ^2" + zForce + "\nVelMult: ^3" + level.velMult);
			//self IPrintLn("Coords: ^3" + self GetOrigin() + "\nAngle: ^2" + angles[1]);
		}
		else if(self IsOnGround() && !gainSpeed)
		{
			gainSpeed = true;
			if(self JumpButtonPressed())
			{
				Self SetVelocity(self GetVelocity() + (0,0,200));
			}
		}
		wait 0.05;
	}
}

comboJumps()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "death" );

	while ( isDefined( self ) )
	{
		wait 0.35;

		if(self IsOnGround())
		{
			self.velMult = 0;
		}
		else
		{
			self.velMult += 1;
		}
	}

}

hudStuff() //doesn't work right now?
{
	level endon( "game_ended" );
	self endon( "disconnect" );
	//attached to the player struct so we can destroy the hud on game_ended
	self.velocity_text = self create_simple_client_hud("default",1.75,"CENTER","BOTTOM",0,-10,1);
	self.velocity_text.label = &"^2UPS: ";
	self.health_text = self create_simple_client_hud("default",1.75,"CENTER","RIGHT",0,-10,1);
	self.health_text.label = &"^1Health: ";
	self.armor_text = self create_simple_client_hud("default",1.75,"CENTER","RIGHT",0,10,1);
	self.armor_text.label = &"^4Armor: ";
	self thread destroy_hud_on_game_end();
	while ( true )
	{
		curTeam = self GetTeam();
		//curHP = self.health;

		//UPS Hud
		curVel = self GetVelocity();
		fSpeed = Floor((Sqrt(Pow(curVel[0], 2.0) + Pow(curVel[1], 2.0))));
		self.velocity_text setValue( fSpeed );

		self.health_text setValue( self.health );
		self.armor_text setValue( self.current_armor );


		wait 0.05;
		//clearStrings();
	}
} 

loadoutAdjustments()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    //self endon( "death" );

	self AllowAds(false);

	self TakeAllWeapons();
	self ClearPerks();

	self GiveWeapon("tar21_mp");
	self SwitchToWeapon("tar21_mp");

	self SetPerk("specialty_bulletaccuracy");
	//self SetPerk("specialty_healthregen");
	self SetPerk("specialty_fallheight");
	self SetPerk("specialty_fastmantle");
	self SetPerk("specialty_fastladderclimb");
	self SetPerk("specialty_fastweaponswitch");
	self SetPerk("specialty_fastads");
}

destroy_hud_on_game_end()
{
	level waittill( "game_ended" );
	wait 0.5;
	if ( isDefined( self.velocity_text ) )
	{
		self.velocity_text destroy();
	}
	if ( isDefined( self.health_text ) )
	{
		self.health_text destroy();
	}
	if ( isDefined( self.armor_text ) )
	{
		self.armor_text destroy();
	}
}

onplayerdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime ) //checked changed to match cerberus output
{
	if ( self.current_armor > 0 )
	{
		excess_damage = 0;
		damage_to_armor = int(idamage * level.armor_absorption);
		if ( damage_to_armor > self.current_armor )
		{
			self.current_armor = 0;
			excess_damage = int(damage_to_armor);
			self iprintln(excess_damage);
		}
		else 
		{
			self.current_armor -= damage_to_armor;
		}
		idamage -= damage_to_armor;
		idamage -= excess_damage;
		if ( idamage < 0 )
		{
			return 0;
		}
	}
	if ( self is_rocket_jumping( smeansofdeath ) )
	{
		modified_rocket_jump_damage = int( idamage * level.rocket_jump_damage_reduction );
		idamage -= modified_rocket_jump_damage;
		vertical_speed = idamage + 2000;
		vertical_speed = 2000;
		self setVelocity( self getVelocity() + ( 0, 0, vertical_speed ) );
	}
	self iprintln(idamage);
	return idamage;
}

is_rocket_jumping( meansOfDeath )
{
	if ( meansOfDeath != "MOD_EXPLOSIVE" )
	{
		return;
	}
	origin = self.origin + ( 0, 0, -10 );
	self is_player_looking_at( origin );
}

is_looking_at_ground()
{
	while ( true )
	{
		origin = self.origin + ( 0, 0, -10 );
		self iPrintLn( self is_player_looking_at( origin ) );
		self iPrintLn( self getVelocity() );
		self setVelocity( self GetVelocity() + ( 0, 0, 20000000 ) );
		wait 1;
	}
}

is_player_looking_at( origin, dot, do_trace, ignore_ent ) //checked matches cerberus output
{
	if ( !isDefined( dot ) )
	{
		dot = 0.7;
	}
	if ( !isDefined( do_trace ) )
	{
		do_trace = 1;
	}
	eye = self get_eye();
	delta_vec = anglesToForward( vectorToAngles( origin - eye ) );
	view_vec = anglesToForward( self getplayerangles() );
	new_dot = vectordot( delta_vec, view_vec );
	if ( new_dot >= dot )
	{
		if ( do_trace )
		{
			return bullettracepassed( origin, eye, 0, ignore_ent );
		}
		else
		{
			return 1;
		}
	}
	return 0;
}

get_eye() //checked matches cerberus output
{
	if ( isplayer( self ) )
	{
		linked_ent = self getlinkedent();
		if ( isDefined( linked_ent ) && getDvarInt( "cg_cameraUseTagCamera" ) > 0 )
		{
			camera = linked_ent gettagorigin( "tag_camera" );
			if ( isDefined( camera ) )
			{
				return camera;
			}
		}
	}
	pos = self geteye();
	return pos;
}

create_simple_client_hud( font, fontscale, align, relative, x, y, sort )
{
	text_elem = self createfontstring( font, fontscale );
	text_elem setPoint( align, relative, x, y );
	text_elem.sort = sort;
	text_elem.hideWhenInMenu = true;
	return text_elem;
}


//Overflow Fix - not by me, credits to unknown
/*
createText(font, fontscale, align, relative, x, y, sort, text)
{
	textElem = CreateFontString( font, fontscale );
	textElem setPoint( align, relative, x, y );
	textElem.sort = sort;
	textElem.hideWhenInMenu = true;

	textElem.type = "text";
	addTextTableEntry(textElem, getStringId(text));
	//textElem setSafeText(self, text);

	return textElem;
}


initOverFlowFix()
{
	self.stringTable = [];
	self.stringTableEntryCount = 0;
	self.textTable = [];
	self.textTableEntryCount = 0;

	if(isDefined(level.anchorText) == false)
	{
		level.anchorText = createServerFontString("default",1.5);
		level.anchorText setText("anchor");
		level.anchorText.alpha = 0;

		level.stringCount = 0;
	}
}

clearStrings()
{
	level.anchorText clearAllTextAfterHudElem();
	level.stringCount = 0;
	self purgeTextTable();
	self purgeStringTable();
	self recreateText();
}

setSafeText(player, text)
{
	stringId = player getStringId(text);

	if(stringId == -1)
	{
		player addStringTableEntry(text);
		stringId = player getStringId(text);
	}

	player editTextTableEntry(self.textTableIndex, stringId);

	if(level.stringCount > 50)
	clearStrings();

	self setText(text);
}

recreateText()
{
	foreach(entry in self.textTable)
	entry.element setSafeText(self, lookUpStringById(entry.stringId));
}

addStringTableEntry(string)
{
	entry = spawnStruct();
	entry.id = self.stringTableEntryCount;
	entry.string = string;

	self.stringTable[self.stringTable.size] = entry;
	self.stringTableEntryCount++;
	level.stringCount++;
}

lookUpStringById(id)
{
	string = "";

	foreach(entry in self.stringTable)
	{
		if(entry.id == id)
		{
			string = entry.string;
			break;
		}
	}

	return string;
}

getStringId(string)
{
	id = -1;

	foreach(entry in self.stringTable)
	{
		if(entry.string == string)
		{
			id = entry.id;
		}
		break;
	}
return id;
}

getStringTableEntry(id)
{
	stringTableEntry = -1;

	foreach(entry in self.stringTable)
	{
		if(entry.id == id)
		{
			stringTableEntry = entry;
			break;
		}
	}

return stringTableEntry;
}

purgeStringTable()
{
	stringTable = [];

	foreach(entry in self.textTable)
	stringTable[stringTable.size] = getStringTableEntry(entry.stringId);

	self.stringTable = stringTable;
}

purgeTextTable()
{
	textTable = [];

	foreach(entry in self.textTable)
	{
		if(entry.id != -1)
		textTable[textTable.size] = entry;
	}

	self.textTable = textTable;
}

addTextTableEntry(element, stringId)
{
	entry = spawnStruct();
	entry.id = self.textTableEntryCount;
	entry.element = element;
	entry.stringId = stringId;

	element.textTableIndex = entry.id;

	self.textTable[self.textTable.size] = entry;
	self.textTableEntryCount++;
}

editTextTableEntry(id, stringId)
{
	foreach(entry in self.textTable)
	{
		if(entry.id == id)
		{
			entry.stringId = stringId;
			break;
		}
	}
}

deleteTextTableEntry(id)
{
	foreach(entry in self.textTable)
	{
		if(entry.id == id)
		{
			entry.id = -1;
			entry.stringId = -1;
		}
	}
}

clear(player)
{
	if(self.type == "text")
	player deleteTextTableEntry(self.textTableIndex);

	self destroy();
}
*/
