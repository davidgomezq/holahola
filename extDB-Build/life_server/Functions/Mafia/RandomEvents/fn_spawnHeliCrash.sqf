
private["_helicrashSpawns","_dropArmsArray","_helicrashArray","_result","_spawnCount","_spawnArray"]; // Telo: Variables para el bucle

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
	// ARMA | CANTIDAD | CARGADOR | CANTIDAD
	_dropArmsArray =
	[
		["srifle_LRR_SOS_F",2,"7Rnd_408_Mag",6],
		["arifle_MXM_Hamr_pointer_F",2,"30Rnd_65x39_caseless_mag",6],
		["srifle_EBR_ARCO_pointer_snds_F",2,"20Rnd_762x51_Mag",6],
		["arifle_Katiba_ACO_pointer_snds_F",2,"30Rnd_65x39_caseless_green",6],
		["arifle_Mk20_ACO_pointer_F",2,"30Rnd_556x45_Stanag",6],
		["arifle_MXC_Holo_pointer_snds_F",2,"30Rnd_65x39_caseless_mag",6],
		["srifle_DMR_01_SOS_F",2,"10Rnd_762x51_Mag",6]
	];
	// VEST | CANTIDAD | HELM | CANTIDAD
	/*_dropArray =
	[
		["V_HarnessOGL_brn",2,"H_Shemag_olive_hs",2],
		["V_TacVest_camo",2,"H_ShemagOpen_tan",2],
		["V_Chestrig_rgr",2,"H_Shemag_khk",2],
		["V_BandollierB_cbr",2,"H_Watchcap_khk",2]
	];*/
	_helicrashArray = [];
	_spawnArray = [];

	// Telo: Seleccion de spawns
	_spawnCount = 2 + round(random(4));
	for "_i" from 1 to _spawnCount do {
		_result = _helicrashSpawns call BIS_fnc_selectRandom;
		_spawnArray pushBack _result;
		_helicrashSpawns = _helicrashSpawns - _result;
	};

	// Telo: Spawns de helicrash seleccionados.
	{
		private["_marker","_text","_heliSpawn","_smokeSpawn","_MilitaryCrate","_randomCrate","_randomPos","_Pos"];
		// Telo: Spawn del heli crash
		_heliSpawn = "Land_Wreck_Heli_Attack_01_F" createVehicle ([(_x select 0),0] call SHK_pos);
		_heliSpawn enableSimulation false;
		_heliSpawn allowDamage false;
		_Pos = position _heliSpawn;
		_smokeSpawn = "test_EmptyObjectForSmoke" createVehicle _Pos;

		// Telo: Caja militar que cae con aleatoriedad
		_MilitaryCrate = 0;
		_randomCrate = random(100);
		if (_randomCrate > 80) then {
			_MilitaryCrate = "Box_NATO_Wps_F" createVehicle ([_heliSpawn,10] call SHK_pos);
			clearWeaponCargoGlobal _MilitaryCrate;
			clearMagazineCargoGlobal _MilitaryCrate;
			clearItemCargoGlobal _MilitaryCrate;
			clearBackpackCargoGlobal _MilitaryCrate;
			_result = _dropArmsArray call BIS_fnc_selectRandom;
			_MilitaryCrate addWeaponCargoGlobal [(_result select 0), (_result select 1)];
			_MilitaryCrate addMagazineCargoGlobal [(_result select 2), (_result select 3)];
		};

		// Telo: Marcador
		_marker = _x select 1;
		createMarker [_marker, _Pos];
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [300,300];
		_text = _x select 2;
		createMarker [_text, _Pos];
		_text setMarkerColor "ColorIndependent";
		_text setMarkerText "Accidente de helicoptero";
		_text setMarkerType "mil_warning";

		_helicrashArray pushBack [_heliSpawn,_smokeSpawn,_MilitaryCrate,_marker,_text];
	} foreach _spawnArray;

	[[3,"<t color='#1EFF00' size='2'>¡ATENCIÓN!</t><br/>Se han registrado nuevos accidentes de helicopteros en Altis. Comprueba tu mapa para saber donde estan."],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	sleep 5400; // 1 hora y media
	// Telo: Eliminamos los helicrash para meter nuevos.
	{
		private["_heli","_smoke","_crate"];
		_heli = _x select 0; _smoke = _x select 1; _crate = _x select 2;
		if(!isNil "_heli" OR !isNull _heli) then { deleteVehicle _heli; };
		if(!isNil "_crate" OR !isNull _crate) then { detach _crate; deleteVehicle _crate; };
		if(!isNil "_smoke" OR !isNull _smoke) then { _smoke setPos (getMarkerPos "helicrash_dropeffects");	};
		deleteMarker (_x select 3);
		deleteMarker (_x select 4);
	} foreach _helicrashArray;
};