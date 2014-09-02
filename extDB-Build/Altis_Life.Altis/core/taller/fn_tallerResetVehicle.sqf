/*
	File: fn_tallerResetVehicle.sqf
	Author: Termi / Termifire
	
	Description:
	Pinta el coche con la textura original
	Basado en el script de BWG
*/

_vehicle = player getVariable "taller_last_veh_selected";
if(isNil {_vehicle}) exitWith {};

_color = _vehicle getVariable ["Life_VEH_color", ""];
[[_vehicle, _color], "life_fnc_colorVehicle", true, false] spawn life_fnc_MP;