#include <macro.h>
/*
	File: fn_returnKey.sqf
	Author: Telo

	Description:
	Devuelve las llaves de los coches en caso de que el jugador las haya perdido por culpa de una desconexion
*/
private["_unit","_veh","_car_owners","_myUID","_carUID"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_veh = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(MG_haveVehKey) exitWith {};
if(isNull _vehicle) exitWith {};
if(isNull _unit) exitWith {};
if(isNil "_unit") exitWith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_veh isKindOf "House_F")) exitWith {};

if(_unit distance _veh < 8) then {
	_car_owners = _veh getVariable "vehicle_info_owners";
	if(!isNil "_car_owners") then {
		{
			_myUID = format["%1",getPlayerUID _unit];
			_carUID = format["%1",_x select 0];
			if(_myUID == _carUID) then
			{
				[[_veh],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
				systemChat localize "STR_ISTR_Lock_AlreadyHave";
			};
		} forEach _car_owners;
	};
};
