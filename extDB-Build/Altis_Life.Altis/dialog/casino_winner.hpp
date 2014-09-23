class casino_winner {
	idd = 1920;
	name = "casino_winner";
	enableSimulation = true;

	class controlsBackground {
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0625;
			y = 0.12;
			w = 0.8375;
			h = 0.64;
		};
	};

	class controls {
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1921;
			x = 0.1375;
			y = 0.4;
			w = 0.7;
			h = 0.26;
		};
		class PrimerElemento: Life_RscPicture
		{
			idc = 1922;
			text = "";
			x = 0.1125;
			y = 0.2;
			w = 0.1625;
			h = 0.2;
		};
		class SegundoElemento: Life_RscPicture
		{
			idc = 1923;
			text = "";
			x = 0.4125;
			y = 0.2;
			w = 0.1625;
			h = 0.2;
		};
		class TercerElemento: Life_RscPicture
		{
			idc = 1924;
			text = "";
			x = 0.7;
			y = 0.2;
			w = 0.1625;
			h = 0.2;
		};
		class Cerrar: Life_RscButtonMenu
		{
			colorBackground[] = {0.533,0.988,0,1};
			colorText[] = {0,0,0,1};
			idc = 1925;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.4125;
			y = 0.7;
			w = 0.1625;
			h = 0.04;
		};
	};
};
