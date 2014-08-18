/*
	File: fn_tallerAction.sqf
	Author: Termi / Termifire
	
	Description:
	Carga la ventana del taller
	Basado en el script de BWG
*/

if(playerSide != civilian) exitWith {};

disableSerialization;
createDialog "Life_taller";
waitUntil {dialog};

_display = findDisplay 1200;
_vehList = _display displayCtrl 1201;
_texList = _display displayCtrl 1202;
_sliderR = _display displayCtrl 1203;
_sliderG = _display displayCtrl 1204;
_sliderB = _display displayCtrl 1205;
_sliderA = _display displayCtrl 1206;
_sliderR sliderSetRange [0, 255];
_sliderG sliderSetRange [0, 255];
_sliderB sliderSetRange [0, 255];
_sliderA sliderSetRange [0, 100];
sliderSetPosition [1203, 128];
sliderSetPosition [1204, 128];
sliderSEtPosition [1205, 128];
sliderSetPosition [1206, 50];
_sliderR ctrlEnable false;
_sliderG ctrlEnable false;
_sliderB ctrlEnable false;
_sliderA ctrlEnable false;
lbClear _vehList;
lbClear _texList;

player setVariable ["taller_cost", 0];
player setVariable ["taller_last_veh_selected", objNull];
player setVariable ["taller_rgba", [128, 128, 128, 50]];
life_vehicles_taller = player nearEntities [["Car", "Air", "Ship"], 50];

{
    _type = typeOf _x;
    _color = _x getVariable ["Life_VEH_color", "null"];

    if(_x in life_vehicles) then {
        _name = getText(configFile >> "CfgVehicles" >> _type >> "displayName");
        _pic = getText(configFile >> "CfgVehicles" >> _type >> "picture");

        _vehList lbAdd format["%1", _name];
        _vehList lbSetValue [(lbSize _vehList)-1, _forEachIndex];
        _vehList lbSetPicture [(lbSize _vehList)-1, _pic];
    };
} forEach life_vehicles_taller;
