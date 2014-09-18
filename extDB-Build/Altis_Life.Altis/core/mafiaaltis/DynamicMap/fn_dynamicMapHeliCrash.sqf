/*
	file: fn_dynamicMapHeliCrash.sqf
	Author: Telo

	Description: Mapa dinamico para Helicrash
*/
private["_item","_chance","_itemName","_resourceZones","_zone","_chance_common_helicrash","_chance_uncommon_helicrash","_chance_rare_helicrash","_common_dropHelicrash","_uncommon_dropHelicrash","_rare_dropHelicrash"];
_resourceZones = ["textHeliCrash1","textHeliCrash2","textHeliCrash3","textHeliCrash4"];
_zone = "";

if(life_action_inUse) exitWith {}; // Telo: Preveemos el exploit
if(vehicle player != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

{
	if(player distance (getMarkerPos _x) < 10) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

// Telo: Niveles de chance del loot de los helicrash
_chance_common_helicrash = 55; // 0 a 55 = 56%
_chance_uncommon_helicrash = 85; // 55 a 85 = 30%
_chance_rare_helicrash = 100; // 85 a 100 = 15%

// Telo: Tablas de loot de los helicrash
_common_dropHelicrash =
[
	"", // No se encontro nada
	"centralita",
	"trajesoldado",
	"chatarra"
];
_uncommon_dropHelicrash =
[
	"piezasmotor",
	"municionmilitar"
];
_rare_dropHelicrash =
[
	"medallas",
	"kevlar"
];

life_action_inUse = true;
_chance = floor random 100;
switch (true) do
{
	case (_chance < _chance_common_helicrash) : { _item = _common_dropHelicrash call BIS_fnc_selectRandom; };
	case (_chance < _chance_uncommon_helicrash) : { _item = _uncommon_dropHelicrash call BIS_fnc_selectRandom; };
	case (_chance < _chance_rare_helicrash) : { _item = _rare_dropHelicrash call BIS_fnc_selectRandom; };
	default { _item = ""; };
};

_diff = [_item,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith { life_action_inUse = false; hint localize "STR_NOTF_InvFull" };

titleText["Explorando el helicotero accidentado...","PLAIN"];
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2;
};

if (_item == "") exitWith {life_action_inUse = false; titleText["No encontraste nada. ¡Busca mejor!","PLAIN"];};

if(([true,_item,1] call life_fnc_handleInv)) then
{
	_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Has encontrado: %1",_itemName],"PLAIN",0.7];
};

life_action_inUse = false;
