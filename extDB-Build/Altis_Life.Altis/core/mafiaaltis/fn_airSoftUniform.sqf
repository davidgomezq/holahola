/*
	file: fn_airSoftUniform.sqf
	Author: Telo

	Description: Equipo de AirSoft
*/
systemChat "EQUIPOOOO";
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
} foreach (assignedItems player);

player addUniform "U_I_CombatUniform";
player addVest "V_PlateCarrier1_rgr";
player addBackpack "B_Carryall_mcamo";
player addHeadgear "H_Helmet_Kerry";
player addWeapon "arifle_Katiba_ARCO_pointer_F";
//player addPrimaryWeaponItem "optic_Arco";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";

player addWeapon "hgun_Pistol_heavy_01_MRD_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] spawn life_fnc_airSoftImmune;
