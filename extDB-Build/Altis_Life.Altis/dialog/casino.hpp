class casino_menu
{
	idd = 1900;
	movingEnable=0;
	name = "casino";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0;
			y = 0.12;
			w = 1;
			h = 0.84;
		};
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.533,0.988,0,1};
			colorText[] = {0,0,0,1};
			idc = -1;
			text = "Maquina tragaperras:"; //--- ToDo: Localize;
			x = 0;
			y = 0.06;
			w = 1;
			h = 0.04;
		};
	};
	class controls {
		class PrimerElemento: Life_RscPicture
		{
			idc = 1901;
			text = "icons\tragaperras\casino.paa";
			x = 0.1125;
			y = 0.2;
			w = 0.1875;
			h = 0.1875;
		};
		class SegundoElemento: Life_RscPicture
		{
			idc = 1902;
			text = "icons\tragaperras\casino.paa";
			x = 0.4125;
			y = 0.2;
			w = 0.1875;
			h = 0.1875;
		};
		class TercerElemento: Life_RscPicture
		{
			idc = 1903;
			text = "icons\tragaperras\casino.paa";
			x = 0.7;
			y = 0.2;
			w = 0.1875;
			h = 0.1875;
		};
		class Juego: Life_RscButtonMenu
		{
			colorBackground[] = {0.533,0.988,0,1};
			idc = 1904;
			text = "Jugar"; //--- ToDo: Localize;
			onButtonClick = "if (!MG_casino_progress) then { [] spawn life_fnc_casino; };";
			x = 0.6125;
			y = 0.9;
			w = 0.175;
			h = 0.04;
		};
		class Cerrar: Life_RscButtonMenu
		{
			colorBackground[] = {0.533,0.988,0,1};
			idc = 1905;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "if (!MG_casino_progress) then { closeDialog 0; };";
			x = 0.25;
			y = 0.9;
			w = 0.175;
			h = 0.04;
		};
		class Intrucciones: Life_RscStructuredText
		{
			idc = 1906;
			text = ""; //--- ToDo: Localize;
			x = 0.0375;
			y = 0.42;
			w = 0.9125;
			h = 0.26;
		};
		class Precios: Life_RscStructuredText
		{
			idc = 1907;
			text = ""; //--- ToDo: Localize;
			x = 0.2625;
			y = 0.72;
			w = 0.5;
			h = 0.14;
		};
	};
};
