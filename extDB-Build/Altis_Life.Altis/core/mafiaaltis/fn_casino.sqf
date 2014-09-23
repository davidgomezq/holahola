#include <macro.h>
/*
	File: fn_casino.sqf
	Author: Telo

	Description: Programacion de la maquina tragaperras
*/
private["_ui","_jackPoint","_firstElement","_secondElement","_thirdElement","_frutasArray","_text","_text1","_text2","_text3"];
_frutasArray =
[
	"icons\tragaperras\morado.paa",
	"icons\tragaperras\naranja.paa",
	"icons\tragaperras\rojo.paa",
	"icons\tragaperras\verde.paa"
];
disableSerialization;
disableUserInput true;
MG_casino_progress = true;
if (MG_casino_counts == 2) then {
	if(life_cash < 5000) exitWith
	{
		disableUserInput false;
		MG_casino_progress = false;
		hint "No tienes dinero en efectivo.";
	};

	life_cash = life_cash - MG_casino_price;
};

MG_casino_counts = MG_casino_counts - 1;

// Telo: Guardamos el jackpoint
life_jackpoint_casino = life_jackpoint_casino + MG_casino_price;
publicVariable "life_jackpoint_casino";

_ui = findDisplay 1900;

// Telo: Actualizamos el JackPoint
_jackPoint = _ui displayCtrl 1907;
_jackPoint ctrlSetStructuredText parseText format["PRECIO POR PARTIDA: <t color='#499125'>$%1</t><br/>BOTE ACUMULADO: <t color='#499125'>$%2</t><br/>Te quedan <t color='#FFB700'>%3</tb> intentos.", MG_casino_price, life_jackpoint_casino, MG_casino_counts];

// Telo: Ejecutamos el cambio.
_firstElement = _ui displayCtrl 1901;
_firstElement ctrlSetText "icons\tragaperras\cambio.paa";
sleep 1;
_secondElement = _ui displayCtrl 1902;
_secondElement ctrlSetText "icons\tragaperras\cambio.paa";
sleep 1;
_thirdElement = _ui displayCtrl 1903;
_thirdElement ctrlSetText "icons\tragaperras\cambio.paa";
sleep 3;

// Telo: Elegimos las frutas.
_text1 = _frutasArray call BIS_fnc_selectRandom;
_firstElement = _ui displayCtrl 1901;
_firstElement ctrlSetText _text1;
sleep 1;
_text2 = _frutasArray call BIS_fnc_selectRandom;
_secondElement = _ui displayCtrl 1902;
_secondElement ctrlSetText _text2;
sleep 1;
_text3 = _frutasArray call BIS_fnc_selectRandom;
_thirdElement = _ui displayCtrl 1903;
_thirdElement ctrlSetText _text3;

// Telo: Si son tod0s iguales le damos el jackpoint y lo reseteamos.
if (_text1 == _text2 && _text1 == _text3) exitWith {
	// Telo: Entregamos el premio
	life_cash = life_cash + life_jackpoint_casino;
	if (MG_casino_counts <= 0) then { MG_casino_counts = 2; };

	[[3,format["<t color='#6400CA' size='1.3'>¡TENEMOS GANADOR!</t><br/><t color='#FFB700'>%1</t> ha ganado el bote acumulado de <t color='#00CE13'>$%2</t> en el <t color='#88FC00'>Mafia Casino</t>. Tendra que ir al banco rapido o alguien puede atracarle.", player getVariable["realname",name player], life_jackpoint_casino]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	closeDialog 0;

	// Telo: Creamos el dialogo de ganador
	createDialog "casino_winner";
	_ui = findDisplay 1920;
	_text = _ui displayCtrl 1921;
	_text ctrlSetStructuredText parseText format["<t align='center' color='#FFB700'>¡ENHORABUENA!</t><br/><t align='center'>Has ganado <t color='#00CE13' size='2'>$%1</t> en el <t color='#88FC00'>Mafia Casino</t>.</t>", life_jackpoint_casino];
	_firstElement = _ui displayCtrl 1922;
	_firstElement ctrlSetText _text1;
	_secondElement = _ui displayCtrl 1923;
	_secondElement ctrlSetText _text2;
	_thirdElement = _ui displayCtrl 1924;
	_thirdElement ctrlSetText _text3;

	// Telo: Reseteamos el jackpoint
	life_jackpoint_casino = 20000 + round(random(20000));
	publicVariable "life_jackpoint_casino";

	disableUserInput false;
	MG_casino_progress = false;

	sleep 10;
	closeDialog 0;
};
// Telo: Si hay dos iguales devolvemos el 50% de lo jugado.
if (_text1 == _text2 OR _text1 == _text3 OR _text2 == _text3) exitWith {
	life_cash = life_cash + (MG_casino_price / 2);
	if (MG_casino_counts <= 0) then { MG_casino_counts = 2; };

	_jackPoint = _ui displayCtrl 1907;
	_jackPoint ctrlSetStructuredText parseText format["PRECIO POR PARTIDA: <t color='#499125'>$%1</t><br/>BOTE ACUMULADO: <t color='#499125'>$%2</t><br/>Te quedan <t color='#FFB700'>%3</tb> intentos.", MG_casino_price, life_jackpoint_casino, MG_casino_counts];

	hint parseText format["<t color='#88FC00'>Mafia Casino</t> te devuelve $%1 por igualar dos frutas.", (MG_casino_price / 2)];
	disableUserInput false;
	MG_casino_progress = false;
};

if (MG_casino_counts <= 0) then { MG_casino_counts = 2; };
disableUserInput false;
MG_casino_progress = false;
