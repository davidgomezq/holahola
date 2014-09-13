/*
	File: fn_airSoftRespawned.sqf
	Author: Telo

	Description: Funcion de respawn para los jugadores de AirSoft.
*/
private["_save"];
//Telo: Seteo de variables.
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_is_alive = true;
MG_AirSoftRespawned = false;
player enableFatigue true;

// Telo: Broadcast de vida
if (MG_AirSoftCurrentLife <= 0) then {
	MG_InAirSoft = false;
	// Telo: Cargamos el equipo del jugador.
	[MG_AirSoftGear] spawn life_fnc_loadDeadGear;
} else {
	systemChat format["Te quedan %1 vidas.", MG_AirSoftCurrentLife];
};
player switchMove "";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

// Telo: Limpiamos el suelo de cadaveres y armas...
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

// Telo: Quitamos la pantalla negra.
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

// Telo: Guardado y preparacion del personaje
[] call life_fnc_hudUpdate;
if (!MG_InAirSoft) then {
	sleep 2;
	[] call SOCK_fnc_updateRequest;
};
