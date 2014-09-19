#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["hgun_P07_snds_F","Taser",2000],
						["HandGrenade_Stone","Flash",1700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_Mk20_F",nil,55000],
						["SMG_02_F",nil,3000],
						["HandGrenade_Stone","Flash",1700],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_MRCO",nil,2500],
						["optic_ACO_grn_smg",nil,600],
						["30Rnd_556x45_Stanag",nil,130],
						["30Rnd_9x21_Mag",nil,250],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};

    case "cop_capitain":
    {
        switch(true) do
        {
            case (playerSide != west): {"You are not a cop!"};
            case (__GETC__(life_coplevel) < 4): {"No eres capitan!"};
            default
            {
                ["Tienda Capitan",
                    [
                    	["arifle_MXM_F",nil,95000],
						["SMG_02_F",nil,3000],
						["arifle_Mk20_plain_F",nil,55000],
						["optic_MRCO",nil,2500],
						["acc_pointer_IR",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_ACO_grn",nil,2500],
						["optic_ACO_grn_smg",nil,600],
                        ["optic_DMS",nil,40000],
						["muzzle_snds_M",nil,3000],
						["muzzle_snds_B",nil,10000],
						["30Rnd_556x45_Stanag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["30Rnd_65x39_caseless_mag",nil,300],
						["HandGrenade_Stone","Flashbang",1700],
						["Rangefinder",nil,4000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};
                      
	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 6): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
					    ["srifle_EBR_F",nil,155000],
					    ["arifle_MXM_F",nil,95000],
						["SMG_02_F",nil,3000],
						["arifle_Mk20_plain_F",nil,55000],
						["optic_MRCO",nil,2500],
						["acc_pointer_IR",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_ACO_grn",nil,2500],
						["optic_ACO_grn_smg",nil,600],
                        ["optic_DMS",nil,40000],
						["muzzle_snds_M",nil,3000],
						["muzzle_snds_B",nil,10000],
						["30Rnd_556x45_Stanag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["20Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["HandGrenade_Stone","Flashbang",1700],
						["Rangefinder",nil,4000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,85000],
						["arifle_TRG21_F",nil,95000],
						["arifle_Katiba_F",nil,215000],
						["srifle_DMR_01_F",nil,320000],
                        ["optic_DMS",nil,140000],
						["optic_Aco",nil,35000],
						["optic_Holosight",nil,36000],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,75000],
						["optic_Arco",nil,75000],
						["30Rnd_9x21_Mag",nil,2000],
						["30Rnd_556x45_Stanag",nil,3000],
						["10Rnd_762x51_Mag",nil,5000],
						["30Rnd_65x39_caseless_green",nil,2750],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,50],
						["Chemlight_yellow",nil,50],
						["Chemlight_green",nil,50],
						["Chemlight_blue",nil,50]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["hgun_Pistol_Signal_F","Pistola de bengalas",7500],
						["6Rnd_GreenSignal_F","Bengalas verdes",25],
						["6Rnd_RedSignal_F","Bengalas rojas",25]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["arifle_SDAR_F",nil,95000],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["20Rnd_556x45_UW_mag",nil,1250],
						["hgun_Pistol_Signal_F","Pistola de bengalas",15000],
						["6Rnd_GreenSignal_F","Bengalas verdes",25],
						["6Rnd_RedSignal_F","Bengalas rojas",25],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,50],
						["Chemlight_yellow",nil,50],
						["Chemlight_green",nil,50],
						["Chemlight_blue",nil,50]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,50],
				["Chemlight_yellow",nil,50],
				["Chemlight_green",nil,50],
				["Chemlight_blue",nil,50]
			]
		];
	};
};
