/*
	File: welcomecredits.sqf
	Author: Tenshi
	Traductions/Corrections:	[OSEF]team
	Date: 04-18-2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen and add camera effect to spawn.
*/

private [ "_camera", "_welcomeMessage", "_camDistance" ];
_welcomeMessage = format["Bienvenido a Mafia Gaming %1, Disfruta!",format["%1", name player]];
_camDistance = 100;
waitUntil { alive player };
//waituntil {!isnull (finddisplay 46)};
showCinemaBorder true;
camUseNVG false;
playsound "IntroCiv";
_camera = "camera" camCreate [(position player select 0)-2, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
["Bienvenido a MafiaGaming","CENTER_UP",2] call arjay_dynamicText;

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 18;

cutText [_welcomeMessage, "PLAIN DOWN"];

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
sleep 1;


_onScreenTime = 5;

sleep 3; //Wait in seconds before the credits start after player is in-game
//player say "Intro";

_role1 = "Bienvenido a MafiaGaming";
_role1names = ["Server Rolplay"];
_role2 = "Web/Foro";
_role2names = ["www.mafiagaming.es"];
_role3 = "Teamspeak3";
_role3names = ["mafia.on.vg"];
_role4 = "Regla Principal";
_role4names = ["Rolear,No insultar,No matar sin rol,No atropellar,No Mirar/Robar Mochilas"];
_role5 = "Gracias";
_role5names = ["Para mas informacion pulsar la tecla M y leer las normas/controles"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.60' color='#00e2f7' align='center'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.80' color='#FFFFFF' align='center'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 1.0,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names]
];