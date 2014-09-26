#include <macro.h>
/*
	File: fn_casinoShop.sqf
	Author: Telo

	Description: Creacion del dialogo de la maquina tragaperras
*/
private["_ui", "_text"];
if (dialog) exitWith {};
disableSerialization;
createDialog "casino_menu";

_ui = findDisplay 1900;
_text = _ui displayCtrl 1906;
_text ctrlSetStructuredText parseText format["Instrucciones:<br/>1 - Ir al banco y sacar mucho dinero.<br/>2 - Darle a <t color='#FFB700'>JUGAR</t>. Tienes dos intentos por cada <t color='#499125'>$5000</t>.<br/>3 - Ganar mucho dinero o perder todo."];

_text = _ui displayCtrl 1907;
_text ctrlSetStructuredText parseText format["PRECIO POR PARTIDA: <t color='#499125'>$%1</t><br/>BOTE ACUMULADO: <t color='#499125'>$%2</t><br/>Te quedan <t color='#FFB700'>%3</tb> intentos.", MG_casino_price, life_jackpoint_casino, MG_casino_counts];
