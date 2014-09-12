enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8 - Dev";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//[] execVM "IgiLoad\IgiLoadInit.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
fn_deadMessages = compile preprocessFileLineNumbers "core\mafiaaltis\fn_deadMessages.sqf";
// Telo: Dynamic Map
{_x setMarkerAlphaLocal 0} forEach ["helicrash_1","helicrash_2","helicrash_3","helicrash_4","wreck_1","wreck_2","wreck_3","wreck_4"];
