/*
    File: fn_airSoftFatigue.sqf
    Author: Telo

    Description: Reseteo de fatiga
*/

[] spawn {
    while {MG_InAirSoft} do {
		player setFatigue 0;
        sleep 1.5;
    };
};