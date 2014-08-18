/*
	File: fn_tallerUpdate.sqf
	Author: Termi / Termifire
	
	Description:
	Actualizar el color del coche
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
_vehicle = life_vehicles_taller select (_vehList lbValue lbCurSel _vehList);
_colors = [typeOf _vehicle] call life_fnc_vehicleColorCfg;
_tex_idx = _texList lbValue lbCurSel _texList;

_selected_looks = "";

if(_tex_idx == -1) then {
    _sliderR ctrlEnable true;
    _sliderG ctrlEnable true;
    _sliderB ctrlEnable true;
    _sliderA ctrlEnable true;

    _lastRGBA = player getVariable ["taller_rgba", [128, 128, 128, 50]];
    _r = (sliderPosition _sliderR);
    _g = (sliderPosition _sliderG);
    _b = (sliderPosition _sliderB);
    _a = (sliderPosition _sliderA);

    // don't let it get too dark!
    if(_a < 20) then { _a = 20; _alpha sliderSetPosition 20; };
    if( (_r + _g + _b) < 100 ) then {
        _r = _lastRGBA select 0;
        _sliderR sliderSetPosition _r;
        _g = _lastRGBA select 1;
        _sliderG sliderSetPosition _g;
        _b = _lastRGBA select 2;
        _sliderB sliderSetPosition _b;
    };
    player setVariable ["taller_rgba", [_r, _g, _b, _a]];

    _r = _r / 255.0;
    _g = _g / 255.0;
    _b = _b / 255.0;
    _a = _a / 100.0;

    _selected_looks = format ['#(argb,8,8,3)color(%1,%2,%3,%4)', _r, _g, _b, _a];
    _vehicle setObjectTextureGlobal [0, _selected_looks];
} else {
    _paintR ctrlEnable false;
    _paintG ctrlEnable false;
    _paintB ctrlEnable false;
    _alpha ctrlEnable false;

    _selected_looks = str(_tex_idx);
    _texture = (_colors select _tex_idx) select 0;
    if(typeName _texture == "ARRAY") then {
        {
          _vehicle setObjectTextureGlobal [_forEachIndex, _x];
        } forEach _texture;
    } else {
        _vehicle setObjectTextureGlobal [0, _texture];
    };
};

[_selected_looks]; // return current values if we want to save them