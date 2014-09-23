#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_smartphoneTarget = ObjNull;
life_is_alive = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,2500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,1000);
__CONST__(life_impound_boat,1200);
__CONST__(life_impound_air,2000);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_atmcash = 7000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
	case civilian:
	{
		life_atmcash = 9250; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};

	case independent: {
		life_atmcash = 6500;
		life_paycheck = 850;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_esposas",
	// Telo: Mafia Gaming
	// Helicrash
	"life_inv_centralita",
	"life_inv_trajesoldado",
	"life_inv_chatarra",
	"life_inv_piezasmotor",
	"life_inv_municionmilitar",
	"life_inv_medallas",
	"life_inv_kevlar",
	// Naufragios
	"life_inv_pergamino",
	"life_inv_vasija",
	"life_inv_jarron",
	"life_inv_doblon",
	"life_inv_brazalete",
	"life_inv_abrecartas",
	"life_inv_catalejo",
	"life_inv_collar",
	"life_inv_cetro"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["cannabis",1000],["turtle",3000],["blastingcharge",10000],["boltcutter",2000],["lockpick",500],["esposas",1000]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",50],
	["heroinu",1850],
	["heroinp",2500],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",40],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",1500],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",4100],
	["diamond",750],
	["diamondc",2600],
	["iron_r",2500],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",150000]
];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",7500000],
	["storagebig",15000000],
	["esposas", 5000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",40000],
	["C_Van_01_fuel_F",25000],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",30000],
	["I_Truck_02_transport_F",30000],
	["I_Truck_02_covered_F",60000],
	["B_Truck_01_transport_F",100000],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",150000],
	["O_Truck_03_device_F",300000],
	["B_Truck_01_box_F", 200000],
	["O_MRAP_02_F",325000],
	["B_Heli_Light_01_F",100000],
	["O_Heli_Light_02_unarmed_F",265000],
	["I_Heli_light_03_unarmed_F",165000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",30000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",40000],
	["C_Van_01_fuel_F",25000],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",30000],
	["I_Truck_02_transport_F",30000],
	["I_Truck_02_covered_F",60000],
	["B_Truck_01_transport_F",100000],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",150000],
	["O_Truck_03_device_F",300000],
	["B_Truck_01_box_F",200000],
	["O_MRAP_02_F",325000],
	["B_Heli_Light_01_F",100000],
	["O_Heli_Light_02_unarmed_F",265000],
	["I_Heli_light_03_unarmed_F",165000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",30000]
];
__CONST__(life_garage_sell,life_garage_sell);

/*
*****************************
****** MAFIA  GAMMING *******
*****************************
*/
// Air Soft
MG_InAirSoft = false;
MG_AirSoftRespawned = false;
MG_AirSoftLifes = 3;
MG_AirSoftCurrentLife = MG_AirSoftLifes;
MG_AirSoftGear = 0;
MG_AirSoftCityNPC = 0; // Telo: Kavala = 0  Athira = 1  Pyrgos = 2  Sofia = 3

// Deposito
MG_inDeposit = false;
// Telo: ¡IMPORTANTE! Se divide entre 2 para obtener el 50% del precio original del vehiculo asi que el precio que aqui se ponga se divira entre dos ¡AVISADOS ESTAIS!
life_deposit_prices =
[
	["B_QuadBike_01_F",2500],
	["C_Hatchback_01_F",9500],
	["C_Offroad_01_F", 12500],
	["B_G_Offroad_01_F",15000],
	["C_SUV_01_F",35000],
	["C_Van_01_transport_F",40000],
	["C_Hatchback_01_sport_F",95000],
	["C_Van_01_fuel_F",25000],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",60000],
	["I_Truck_02_transport_F",150000],
	["I_Truck_02_covered_F",260000],
	["B_Truck_01_transport_F",600000],
	["O_Truck_03_transport_F",600000],
	["O_Truck_03_covered_F",1200000],
	["O_Truck_03_device_F",2500000],
	["B_Truck_01_box_F", 2000000],
	["O_MRAP_02_F",750000],
	["B_Heli_Light_01_F",400000],
	["O_Heli_Light_02_unarmed_F",750000],
	["C_Rubberboat",5000],
	["C_Boat_Civil_01_F",22000],
	["B_Boat_Transport_01_F",3000],
	["C_Boat_Civil_01_police_F",20000],
	["B_Boat_Armed_01_minigun_F",75000],
	["B_SDV_01_F",100000],
	["B_MRAP_01_F",50000]
];
__CONST__(life_deposit_prices,life_deposit_prices);

// Telo: Menu Toggle
MG_yMenu = "";

// Telo: Casino.
MG_casino_progress = false;
MG_casino_price = 5000;
MG_casino_counts = 2;
