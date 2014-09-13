#include <macro.h>

/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_donatorlevel","_playerPosition"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};


_playerPosition = civ_position;
diag_log format ["%1",_playerPosition]; //For debugging

// Set donor pay check increase
switch (__GETC__(life_donator)) do
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1000; }; //Level 2
				case 3: { _donatorlevel = 1500; }; //Level 3
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

if (!life_is_alive) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
}
else
{
	if(life_is_arrested) then {
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else {
		// Telo: Si un jugador se conecta en la zona de airsoft tiene que salir de ahi
		if(player distance (getMarkerPos "airsoft_marker") < 75) then
		{
			[] call life_fnc_spawnMenu;
			waitUntil{!isNull (findDisplay 38500)};
			waitUntil{isNull (findDisplay 38500)};
		} else {
			player setPos _playerPosition;
			hint format[localize "STR_MAFIA_POSITION"];
		}
	};
	life_is_alive = true;
};


player addRating 9999999;
[] execVM "IntroCiv.sqf";