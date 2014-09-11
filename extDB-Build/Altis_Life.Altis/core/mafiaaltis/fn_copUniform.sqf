#include <macro.h>
/*
		SCRIPT DE UNIFORME DE POLICIA
		Autor: Telo. Idea original Altis Life RPG
*/
if (playerSide != west) exitWith {};

switch(__GETC__(life_coplevel)) do
{
	case 1: {
		player setObjectTextureGlobal [0, "textures\uniformes\policia.jpg"];
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 2: {
		player setObjectTextureGlobal [0, "textures\uniformes\policia.jpg"];
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 3: {
		player setObjectTextureGlobal [0, "textures\uniformes\patrullero.jpg"];
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 4: {
		player setObjectTextureGlobal [0, "textures\uniformes\oficial.jpg"];
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 5: {
		player setObjectTextureGlobal [0, "textures\uniformes\agente_montana.jpg"];
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 6: {
		player addUniform "U_B_CombatUniform_mcam_worn";
		[[player,0,"textures\uniformes\geo.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		unitBackpack player setObjectTextureGlobal [0,""];
	};

	case 7: {
		player addUniform "U_B_CombatUniform_mcam_worn";
		[[player,0,"textures\uniformes\geo.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		unitBackpack player setObjectTextureGlobal [0,""];
	};
};
