/*

	Sets jail values for player

*/
private["_unit", "_bad", "_query", "_result", "_time"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;


_query = format["UPDATE players SET jail_time='%1' WHERE playerid='%2'", _time, _bad];

if(_query == "") exitWith {};
waitUntil{!DB_Async_Active};
_result = [_query,1] call DB_fnc_asyncCall;
