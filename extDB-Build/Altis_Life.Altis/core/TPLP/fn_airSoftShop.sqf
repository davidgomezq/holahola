/*
	file: fn_airSoftShop.sqf
	Author: Telo

	Description: NPC de teleport al AirSoft
*/
private["_selectSpawnPoint"];
if (playerSide != civilian) exitWith {};
if (life_cash < 1000) exitWith {
	hint "No tienes suficiente dinero para jugar a AirSoft";
};

// Telo: Guardado previo de equipo
MG_AirSoftGear = [player] call life_fnc_fetchDeadGear;
MG_AirSoftCurrentLife = MG_AirSoftLifes;
[] call life_fnc_saveGear;
[] call SOCK_fnc_updateRequest;

// Telo: Seteo de variables
MG_InAirSoft = true;
life_cash = life_cash - 1000;
player setVariable["inAirSoft",true,true];

// Telo: Teleport
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
[] spawn life_fnc_airSoftFatigue;
