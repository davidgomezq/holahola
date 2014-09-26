
private["_wreckSpawns","_wreckArray","_result","_spawnCount","_spawnArray"]; // Telo: Variables para el bucle
/*
sleep 15; // Delay con respecto a los Heli crash
while {true} do
{
	// Telo: Seteo de variables
	_wreckSpawns =
	[
		["wreck_1","markerWreck1","textWreck1"],
		["wreck_2","markerWreck2","textWreck2"],
		["wreck_3","markerWreck3","textWreck3"],
		["wreck_4","markerWreck4","textWreck4"]
	];
	_wreckArray = [];
	_spawnArray = [];

	// Telo: Seleccion de spawns
	_spawnCount = 2 + round(random(4));
	for "_i" from 1 to _spawnCount do {
		_result = _wreckSpawns call BIS_fnc_selectRandom;
		_spawnArray pushBack _result;
		_wreckSpawns = _wreckSpawns - _result;
	};

	// Telo: Spawns de naufragios seleccionados.
	{
		private["_marker","_text","_wreckSpawn","_Pos"];
		// Telo: Spawn del heli crash
		_wreckSpawn = "Land_UWreck_FishingBoat_F" createVehicle ([(_x select 0),2] call SHK_pos);
		_wreckSpawn enableSimulation false;
		_wreckSpawn allowDamage false;
		_Pos = position _wreckSpawn;

		// Telo: Marcador
		_marker = _x select 1;
		createMarker [_marker, _Pos];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [300,300];
		_text = _x select 2;
		createMarker [_text, _Pos];
		_text setMarkerColor "ColorYellow";
		_text setMarkerText "Barco hundido";
		_text setMarkerType "mil_warning";

		_wreckArray pushBack [_wreckSpawn,_marker,_text];
	} foreach _spawnArray;

	[[3,"<t color='#425FB2' size='2'>¡ATENCIÓN!</t><br/><t color='#FFB700'>La Guardia Costera de Altis</t> ha perdido de vista a los barcos que estaban por la costa, es posible que se hayan hundido con el cargamento, consulta el mapa para ir a buscar los tesoros."],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	sleep 6300; // 1 hora y 45 minutos
	// Telo: Eliminamos los naufragios para meter nuevos.
	{
		private["_wreck"];
		_wreck = _x select 0;
		if(!isNil "_wreck" OR !isNull _wreck) then { deleteVehicle _wreck; };
		deleteMarker (_x select 1);
		deleteMarker (_x select 2);
	} foreach _wreckArray;
};*/