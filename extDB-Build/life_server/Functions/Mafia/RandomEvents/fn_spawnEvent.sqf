
/*private["_i","_aux","_helicrashSpawns","_helicrashArray","_result","_spawnCount","_spawnArray","_heliSpawn","_smokeSpawn","_fireSpawn"]; // Telo: Variables para el bucle

while {true} do
{
	// Telo: Seteo de variables
	_helicrashSpawns =
	[
		["helicrash_1","markerHeliCrash1","textHeliCrash1"],
		["helicrash_2","markerHeliCrash2","textHeliCrash2"],
		["helicrash_3","markerHeliCrash3","textHeliCrash3"],
		["helicrash_4","markerHeliCrash4","textHeliCrash4"]
	];
	_helicrashArray = [];
	_spawnArray = [];

	// Telo: Seleccion de spawns
	_spawnCount = 2 + round(random(4));
	for [{_i = 1}, {_i <= _spawnCount}, {_i =_i + 1}] do {
		_result = _helicrashSpawns call BIS_fnc_selectRandom;
		_spawnArray pushBack _result;
		_helicrashSpawns = _helicrashSpawns - _result;
	};
	// Telo: Spawns de helicrash seleccionados.
	{
		private["_marker","_text"];
		// Telo: Spawn del heli crash
		_heliSpawn = "Land_Wreck_Heli_Attack_01_F" createVehicle ([_x select 0,0] call SHK_pos);
		_Pos = position _heliSpawn;
		_smokeSpawn = "test_EmptyObjectForSmoke" createVehicle _Pos;
		_smokeSpawn attachTo[_heliSpawn,[0,1.5,-1]];
		_fireSpawn = "test_EmptyObjectForFireBig" createVehicle _Pos;
		_fireSpawn attachTo[_heliSpawn,[0,1.5,-1]];
		//[3.5,1,-1]
		// Telo: Marcador
		_marker = _x select 1;
		createMarker [_marker, _Pos];
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [400,400];
		_text = _x select 2;
		createMarker [_text, _Pos];
		_text setMarkerColor "ColorBlack";
		_text setMarkerText "Accidente de helicoptero";
		_text setMarkerType "mil_warning";

		_helicrashArray pushBack [_heliSpawn,_marker,_text];
	} foreach _spawnArray;

	[[1,"¡ATENCIÓN! Se han registrado accidentes de helicopteros en Altis. Comprueba tu mapa para saber donde estan."],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	[[1,"Spawneados"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	sleep 20;
	// Telo: Eliminamos los helicrash para meter nuevos.
	diag_log format["helipointer = %1", _helicrashArray];
	{
		private["_heli","_smoke","_fire"];
		_heli = _x select 0;
		_smoke = _x select 1;
		_fire = _x select 2;
		if(!isNil "_heli" OR !isNull _heli) then {
			deleteVehicle _heli;
		};
		deleteVehicle (_x select 1);
		deleteVehicle (_x select 2);
		deleteMarker (_x select 3);
		deleteMarker (_x select 4);
	} foreach _helicrashArray;

	[[1,"Borrados"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	sleep 20;
};*/