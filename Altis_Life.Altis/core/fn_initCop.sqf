#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end","_donatorlevel"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in [""])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	// Pago de donadores
switch (__GETC__(life_donator)) do 
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1000; }; //Level 2
				case 3: { _donatorlevel = 1500; }; //Level 3
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

// Pago de rangos policiales
switch (__GETC__(life_coplevel)) do 
			{
				case 1: { life_paycheck = ((2000) + (_donatorlevel)); }; //Cadete
				case 2: { life_paycheck = ((3000) + (_donatorlevel)); }; //Oficial
				case 3: { life_paycheck = ((4000) + (_donatorlevel)); }; //CNP
				case 4: { life_paycheck = ((5000) + (_donatorlevel)); }; //GC
				case 5: { life_paycheck = ((6000) + (_donatorlevel)); }; //CNP Oficial
				case 6: { life_paycheck = ((6500) + (_donatorlevel)); }; //GC Oficial
				case 7: { life_paycheck = ((7000) + (_donatorlevel)); }; //Geo
				default { life_paycheck = ((1500) + (_donatorlevel)); }; //Defecto
			};
};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] execVM "IntroCop.sqf";
[] call life_fnc_copUniform;
