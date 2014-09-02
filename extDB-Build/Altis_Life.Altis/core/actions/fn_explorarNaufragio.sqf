/*
	File: fn_explorarNaufragio.sqf
	Author: Termi / Termifire
	
	Description:
	Explore a shipwreck to find lost treasures
*/
private["_item","_itemWeight","_rNumber","_itemName"];

_itemWeight = 4;

if(life_carryWeight + _itemWeight <= life_maxWeight) then
{
	life_action_inUse = true;
	_rNumber = floor random 100;
	switch (true) do
	{
		case (_rNumber < 50) : {_item = "";};
		case (_rNumber < 80) : {_item = "catalejo";};
		case (_rNumber < 92) : {_item = "abrecartas";};
		case (_rNumber < 99) : {_item = "collar";};
		default {_item = "cetro";};
	};
	titleText["Explorando Naufragio...","PLAIN"];
	sleep 7.5;
	if (_item == "") exitWith {life_action_inUse = false; titleText["No encontraste nada","PLAIN"];};

	if(([true,_item,1] call life_fnc_handleInv)) then
	{
		_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText[format["Has encontrado un %1",_itemName],"PLAIN",0.7];
	};
}
	else
{
	hint "No tienes suficiente espacio!";
};

life_action_inUse = false;