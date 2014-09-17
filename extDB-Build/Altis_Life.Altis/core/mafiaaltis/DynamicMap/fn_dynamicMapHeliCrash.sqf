/*
	file: fn_dynamicMapHeliCrash.sqf
	Author: Telo

	Description: Mapa dinamico para Helicrash
*/
private["_item","_itemWeight","_rNumber","_itemName"];

_itemWeight = 4;
if(life_carryWeight + _itemWeight <= life_maxWeight) then
{
	life_action_inUse = true;
	_rNumber = floor random 100;
	switch (true) do
	{
		case (_rNumber < 15) : {_item = "";};
		case (_rNumber < 50) : {_item = "centralita";};
		case (_rNumber < 70) : {_item = "trajesoldado";};
		case (_rNumber < 90) : {_item = "municionmilitar";};
		default {_item = "kevlar";};
	};
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
		titleText[format["Has encontrado un %1",_itemName],"PLAIN",0.7];
	};
}
	else
{
	hint localize STR_NOTF_InvFull;
};

life_action_inUse = false;
