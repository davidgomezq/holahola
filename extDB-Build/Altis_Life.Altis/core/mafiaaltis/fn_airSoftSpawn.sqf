/*
	File: fn_airSoftSpawn.sqf
	Author: Telo

	Description:
	Spawn en la ciudad correspondiente.
*/
private["_selectSpawnPoint"];
disableSerialization;

MG_AirSoftCurrentLife = MG_AirSoftCurrentLife - 1;
[] spawn life_fnc_airSoftRespawned;

cutText["","BLACK FADED"];
0 cutFadeOut 2;
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

if (MG_AirSoftCurrentLife < 1) then {
	switch(MG_AirSoftCityNPC) do
	{
		case 0: {
			player setPos (getMarkerPos "airsoft_kavala");
		};
		case 1: {
			player setPos (getMarkerPos "airsoft_athira");
		};
		case 2: {
			player setPos (getMarkerPos "airsoft_pyrgos");
		};
		case 3: {
			player setPos (getMarkerPos "airsoft_sofia");
		};
	};
	MG_InAirSoft = false;
} else {
	_selectSpawnPoint = round(random(6));
	switch (_selectSpawnPoint) do
	{
		case 0: {
			player setPos (getMarkerPos "airsoft_spawn1");
		};
		case 1: {
			player setPos (getMarkerPos "airsoft_spawn2");
		};
		case 2: {
			player setPos (getMarkerPos "airsoft_spawn3");
		};
		case 3: {
			player setPos (getMarkerPos "airsoft_spawn4");
		};
		case 4: {
			player setPos (getMarkerPos "airsoft_spawn5");
		};
		case 5: {
			player setPos (getMarkerPos "airsoft_spawn6");
		};
		case 6: {
			player setPos (getMarkerPos "airsoft_spawn7");
		};
	};
	[] call life_fnc_airSoftUniform;
};