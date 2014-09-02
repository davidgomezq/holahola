#include <macro.h>
/*
	File: fn_tallerVehSelected.sqf
	Author: Termi / Termifire
	
	Description:
	Cargar colores cuando se elige un coche
	Basado en el script de BWG
*/

disableSerialization;
_display = findDisplay 1200;
_vehList = _display displayCtrl 1201;
_texList = _display displayCtrl 1202;
_sliderR = _display displayCtrl 1203;
_sliderG = _display displayCtrl 1204;
_sliderB = _display displayCtrl 1205;
_sliderA = _display displayCtrl 1206;
_sliderR ctrlEnable false;
_sliderG ctrlEnable false;
_sliderB ctrlEnable false;
_sliderA ctrlEnable false;
lbClear _texList;

_last_veh = player getVariable ["taller_last_veh_selected", objNull];
if(!isNull _last_veh) then {
    _last_veh call life_fnc_tallerResetVehicle;
};
_vehicle = life_vehicles_taller select (_vehList lbValue lbCurSel _vehList);
player setVariable ["taller_last_veh_selected", _vehicle];

// if players try something funny, reset the vehicle
_this_spot = getPos player;
_distance = player distance _vehicle;
[_vehicle, _this_spot, _distance] spawn {
    private ["_vehicle", "_this_spot", "_distance"];
    _vehicle = _this select 0;
    _this_spot = _this select 1;
    _distance = _this select 2;
    while {alive _vehicle
        && _this_spot distance _vehicle < (_distance + 1)
        && (player getVariable ["taller_last_veh_selected", objNull] == _vehicle)}
    do {
        sleep 5;
    };
    _vehicle call life_fnc_tallerResetVehicle;
};

_rgba = false;

if ((typeOf _vehicle) in ["C_Offroad_01_F","I_Truck_02_covered_F","I_Truck_02_transport_F","B_Heli_Light_01_F","I_Heli_Transport_02_F"]) then {
	_rgba = true;
};

_colors = [typeOf _vehicle] call life_fnc_vehicleColorCfg;
{
    _name = [typeOf _vehicle, _forEachIndex] call life_fnc_vehicleColorStr;
    _allowed = _x select 1;

    if( _allowed == "civ" || (_allowed == "donate" && __GETC__(life_donator) > 0)) then {
        _texList lbAdd _name;
        _texList lbSetValue [(lbSize _texList)-1, _forEachIndex];
    };
} forEach _colors;


if(_rgba) then {
    _texList lbAdd "Color custom (cambiar abajo)";
    _texList lbSetValue [(lbSize _texList)-1, -1];
};

if(lbSize _texList == 0) then {
    // disable Looks selection
    _looksList lbAdd "No customizacion disponible";
    _looksList ctrlEnable false;
};