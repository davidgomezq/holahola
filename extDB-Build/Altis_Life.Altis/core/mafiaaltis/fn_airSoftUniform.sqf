/*
	file: fn_airSoftUniform.sqf
	Author: Telo

	Description: Equipo de AirSoft
*/
private["_selectSpawnPoint"];
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

// Uniforme
//player addUniform "U_I_CombatUniform";
player addVest "V_PlateCarrier1_rgr";
player addHeadgear "H_Helmet_Kerry";

// Primaria
player addWeapon "arifle_Katiba_ARCO_pointer_F";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";
player addMagazine "30Rnd_65x39_caseless_green";

// Secundaria
player addWeapon "hgun_Pistol_heavy_01_MRD_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

// Medicina
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";

// Mapa, gps, etc...
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles";
player assignItem "NVGoggles";

[] spawn life_fnc_airSoftImmune;
