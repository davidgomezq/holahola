class impound_time
{
	idd = 1800;
	name = "impound_time";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.25;
			y = 0.32;
			w = 0.45;
			h = 0.4;
		};
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = "Embargo de vehiculo"; //--- ToDo: Localize;
			x = 0.251826;
			y = 0.2623;
			w = 0.45;
			h = 0.04;
		};
	};
	class controls {
		class TiempoEmbargo: Life_RscEdit
		{
			idc = 1801;
			text = "15"; //--- ToDo: Localize;
			x = 0.3375;
			y = 0.56;
			w = 0.2625;
			h = 0.04;
		};
		class Descripcion: Life_RscStructuredText
		{
			idc = 1802;
			text = "El tiempo maximo para embargar son 4 horas. ¡RECUERDA, SIEMPRE PON EL TIEMPO EN MINUTOS!"; //--- ToDo: Localize;
			x = 0.3125;
			y = 0.36;
			w = 0.325;
			h = 0.16;
		};
		class BotonEmbargar: Life_RscButtonMenu
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 1803;
			text = "Embargar"; //--- ToDo: Localize;
			onButtonClick = "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
			x = 0.2875;
			y = 0.66;
			w = 0.15;
			h = 0.04;
		};
		class BotonCerrar: Life_RscButtonMenu
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 1804;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.5125;
			y = 0.66;
			w = 0.15;
			h = 0.04;
		};
	};
};