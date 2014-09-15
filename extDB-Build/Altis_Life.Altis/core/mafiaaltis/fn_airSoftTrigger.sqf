/*
	file: fn_airSoftTrigger.sqf
	Author: Telo

	Description: Si alguien se acerca o sale con un coche lo manda al garage
*/
private["_nearVehicles","_vehicle"];

if(vehicle player != player) then
{
	_vehicle = vehicle player;
};

if(isNil "_vehicle") exitWith {};
if(isNull _vehicle) exitWith {};
[[_vehicle,false,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
hint "<t color='#FF0000'>Esta prohibido acercarse al campo de Airsoft.</t> Tu vehiculo ha sido enviado al garage.";
life_garage_store = true;
