a3C_missionsRun = 0;
a3C_missionCap = 25;

a3C_BanditClass = ["rhs_msv_emr_sergeant", "rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman", "rhs_msv_emr_LAT", "rhs_msv_emr_machinegunner", "rhs_msv_emr_grenadier_rpg"];
a3C_TruckClass = ["rhs_msv_emr_sergeant", "rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman", "rhs_msv_emr_LAT", "rhs_msv_emr_machinegunner", "rhs_msv_emr_grenadier_rpg"];

for "_i" from 0 to a3C_missionCap do 
{
	[] call a3C_Server_fnc_missionGen;
	uiSleep 50;
};