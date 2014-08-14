/*
		SCRIPT DE UNIFORME DE POLICIA
		Autor: coldgas (http://altis.newhopeoutfit.de)
		Created for www.altisliferpg.com
*/
#define __GETC__(var) (call var)

//Configuracion de uniformes por nivel de policia
if (__GETC__(life_coplevel) == 1) then {
	player setObjectTextureGlobal [0,"textures\policia.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 2) then {
	player setObjectTextureGlobal [0,"textures\policia.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 3) then {
	player setObjectTextureGlobal [0,"textures\patrullero.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 4) then {
	player setObjectTextureGlobal [0,"textures\piloto.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 5) then {
	player setObjectTextureGlobal [0,"textures\agente_montana.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 6) then {
	player setObjectTextureGlobal [0,"textures\geo.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};
if (__GETC__(life_coplevel) == 7) then {
	player setObjectTextureGlobal [0,"textures\oficial.jpg"];
	unitBackpack player setObjectTextureGlobal [0,""];
};