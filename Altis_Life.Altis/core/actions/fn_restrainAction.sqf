/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
+if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

if(playerSide == civilian) then {
	if(!([false,"esposas",1] call life_fnc_handleInv)) exitWith {};
};
//Broadcast!
player say3D "cuff";

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
+[[0,format["%1 was restrained by %2", name _unit, name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
