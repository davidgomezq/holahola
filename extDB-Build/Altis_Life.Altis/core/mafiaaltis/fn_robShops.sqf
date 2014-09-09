/*
	file: fn_robShops.sqf
	Author: MrKraken y modificado por Telo de Mafia Gaming
	Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
	Description:
	Executes the rob shob action!
	Idea developed by PEpwnzya v1.0
*/

private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint localize "STR_ROBSHOP_CANTROB" };
if(_robber distance _shop > 5) exitWith { hint localize "STR_ROBSHOP_5M" };

if !(_kassa) then {_kassa = 1000;};
if (_rip) exitWith { hint localize "STR_ROBSHOP_ROBINPROGRESS" };
if (vehicle player != _robber) exitWith { hint localize "STR_ROBSHOP_OUTVEH" };

if !(alive _robber) exitWith {};
if({side _x == west} count playableUnits < 1) exitWith {hint localize "STR_ROBSHOP_IFCOP"};
if (currentWeapon _robber == "") exitWith { hint localize "STR_ROBSHOP_NEEDWEAPON" };
if (_kassa == 0) exitWith { hint localize "STR_ROBSHOP_NOMONEY" };

_rip = true;
_kassa = 5000 + round(random 10000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 80) then {
	hint localize "STR_ROBSHOP_POLICECOME";
	[[1,format[localize "STR_ROBSHOP_TUOLETAS", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format[localize "STR_ROBSHOP_BARROB1","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
	while{true} do
	{
		sleep 0.85;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format[localize "STR_ROBSHOP_BARROB2",round(_cP * 100),"%"];
		_Pos = position player; // by ehno: get player pos

		_marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
		"Marker200" setMarkerColor "ColorRed";
		"Marker200" setMarkerText localize "STR_ROBSHOP_ATTENTION";
		"Marker200" setMarkerType "mil_warning";

		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 10.5) exitWith { };
		if!(alive _robber) exitWith {};
	};

	if!(alive _robber) exitWith { _rip = false; };
	if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint localize "STR_ROBSHOP_10M"; 5 cutText ["","PLAIN"]; _rip = false; };
	5 cutText ["","PLAIN"];

	titleText[format[localize "STR_ROBSHOP_SUCCESROB",[_kassa] call life_fnc_numberText],"PLAIN"];
	deleteMarker "Marker200"; // by ehno delete maker
	life_cash = life_cash + _kassa;

	_rip = false;
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
	[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
_action = _shop addAction["Robar la gasolinera",life_fnc_robShops];
_shop switchMove "";