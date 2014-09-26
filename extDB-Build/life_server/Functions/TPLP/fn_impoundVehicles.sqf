/*

	File: fn_impoundVehicles.sqf
	Author: Telo

	Description:
	Guardar el tiempo de embargo en la DB

*/
private["_vehicle","_query","_result","_time","_vInfo","_plate","_uid"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,0,[0]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

_query = format["UPDATE vehicles SET impound = '1', impound_time = CURRENT_TIMESTAMP + INTERVAL '%1' MINUTE WHERE pid='%2' AND plate='%3'", _time, _uid, _plate];

if(_query == "") exitWith {};
waitUntil{!DB_Async_Active};
_result = [_query,1] call DB_fnc_asyncCall;