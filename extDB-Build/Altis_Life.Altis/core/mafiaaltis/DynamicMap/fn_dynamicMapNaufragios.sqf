/*
	File: fn_dynamicMapNaufragios.sqf
	Author: Telo

	Description:
	Mapa dinamico para Naufragios
*/
private["_item","_chance","_itemName","_resourceZones","_zone","_pos","_diff","_chance_common_naufragios","_chance_uncommon_naufragios","_chance_rare_naufragios","_chance_epic_naufragios","_common_dropNaufragios","_uncommon_dropNaufragios","_rare_dropNaufragios","_epic_dropNaufragios"];
_resourceZones = ["textWreck1","textWreck2","textWreck3","textWreck4"];
_zone = "";

if(life_action_inUse) exitWith {}; // Telo: Preveemos el exploit
if(vehicle player != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

{
	if(round((getPosATL player) distance (getMarkerPos _x)) < 10) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

// Telo: Niveles de chance del loot de los Naufragios
_chance_common_naufragios = 60;
_chance_uncommon_naufragios = 85;
_chance_rare_naufragios = 97;
_chance_epic_naufragios = 100;

// Telo: Tablas de loot de los Naufragios
_common_dropNaufragios =
[
	"", // No se encontro nada
	"pergamino",
	"vasija",
	"jarron"
];
_uncommon_dropNaufragios =
[
	"doblon",
	"brazalete",
	"abrecartas"
];
_rare_dropNaufragios =
[
	"catalejo",
	"collar",
	"cetro"
];
_epic_dropNaufragios =
[
	"goldbar"
];

life_action_inUse = true;
_chance = floor random 100;
switch (true) do
{
	case (_chance < _chance_common_naufragios) : { _item = _common_dropNaufragios call BIS_fnc_selectRandom; };
	case (_chance < _chance_uncommon_naufragios) : { _item = _uncommon_dropNaufragios call BIS_fnc_selectRandom; };
	case (_chance < _chance_rare_naufragios) : { _item = _rare_dropNaufragios call BIS_fnc_selectRandom; };
	case (_chance < _chance_epic_naufragios) : { _item = _epic_dropNaufragios call BIS_fnc_selectRandom; };
	default { _item = ""; };
};

_diff = [_item,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith { life_action_inUse = false; hint localize "STR_NOTF_InvFull" };

for "_i" from 0 to 4 do
{
	titleText["Explorando Naufragio...","PLAIN"];
	sleep 1.5;
	titleText[" ","PLAIN"];
};

if (_item == "") exitWith {life_action_inUse = false; titleText["No encontraste nada","PLAIN"];};

if(([true,_item,1] call life_fnc_handleInv)) then
{
	_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Has encontrado: %1",_itemName],"PLAIN",0.7];
};

life_action_inUse = false;