/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {100000}; //Pilot/air license cost
	case "gun": {20000}; //Firearm/gun license cost
	case "dive": {15000}; //Diving license cost
	case "oil": {20000}; //Oil processing license cost
	case "cair": {60000}; //Cop Pilot License cost
	case "swat": {90000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {40000}; //Heroin processing license cost
	case "marijuana": {25000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {150000}; //Gang license cost
	case "rebel": {250000}; //Rebel license cost
	case "truck": {40000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {15000};
	case "cocaine": {70000};
	case "sand": {15000};
	case "iron": {20000};
	case "copper": {15000};
	case "cement": {12000};
	case "mair": {15000};
	case "home": {250000};
};