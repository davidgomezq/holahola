/*
	File: fn_tallerApply.sqf
	Author: Termi / Termifire
	
	Description:
	Aplicar el color elegido al vehiculo
	Basado en el script de BWG
*/

_changes = call life_fnc_tallerUpdate;

if(life_cash < 1000) exitWith {
    hint "Necesitas 1.000€!";
};

life_no_injection = true;
life_cash = life_cash - 1000;

_color = _changes select 0;

disableSerialization;
_display = findDisplay 1200;
_vehList = _display displayCtrl 1201;
_vehicle = life_vehicles_taller select (_vehList lbValue lbCurSel _vehList);
_vehicle setVariable ["Life_VEH_color", _color, true];
[[_vehicle, _color], "life_fnc_colorVehicle", true, false] spawn life_fnc_MP;

closeDialog 0;

player say3D "paint";