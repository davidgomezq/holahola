#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{

	};

	//Hats
	case 1:
	{
	    _ret pushBack ["H_Beret_blk",nil,75];
	    _ret pushBack ["H_Beret_blk_POLICE",nil,75];
	    _ret pushBack ["H_Cap_blk",nil,75];

		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["H_Beret_grn",nil,75];
			_ret pushBack ["H_Booniehat_dgtl",nil,120];
			_ret pushBack ["H_MilCap_dgtl",nil,100];
		};

		if(__GETC__(life_coplevel) > 6) then
		{
			_ret pushBack ["H_Watchcap_blk",nil,100];
			_ret pushBack ["H_HelmetSpecO_blk",nil,100];
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["V_HarnessOSpec_gry",nil,3000];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,9000];
		}
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,1500],
			["B_Carryall_cbr",nil,1900]
		];
	};
};

_ret;