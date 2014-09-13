/*
	file: fn_airSoftImmune.sqf
	Author: Telo

	Description: Inmunidad de los jugadores al entrar/respawnear en el AirSoft
*/
private["_time"];
player allowDamage false;
player setVariable["Immune",true,true];

_time = 10;
while{_time > 0} do
{
	hint format["Eres inmune durante %1 segundos ¡Recarga tu arma y ponte a cubierto!", _time];

	sleep 1;
	_time = _time - 1;
};

player allowDamage true;
player setVariable["Immune",false,true];
hint "Has dejado de ser inmune. ¡Cuida tu culo!";