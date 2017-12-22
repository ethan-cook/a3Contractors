params ["_pos"];

a3C_missionsRun = a3C_missionsRun + 1;
_count = random [0,10,20];
_group = createGroup east;

_missionMarker = createMarker[("Truck" + str(a3C_missionsRun)), _pos];
_missionMarker setMarkerColor "ColorRed";
_missionMarker setMarkerShape "ELLIPSE";
_missionMarker setMarkerBrush "Solid";
_missionMarker setMarkerSize [150,150];
_missionMarker setMarkerText ("Truck" + str(a3C_missionsRun));


for "_i" to _count do
{
	_selClass = selectRandom a3C_TruckClass;
	_unitSpawn = _group createUnit [_selClass, _pos, [], 10, "FORM"];
	
	_unitSpawn setVariable ["cash", (random [10,40,100]), true];
};

_veh = createVehicle ["C_Truck_02_covered_F",_pos,[],0,"NONE"];
[
	_veh,
	["OrangeBlue",1], 
	["spz_hide",1]
] call BIS_fnc_initVehicle;

_veh setVariable ["cash", (random [500, 800, 5000]), true];
_veh setVariable ["markerName", ("Truck" + str(a3C_missionsRun)), true];
_veh setVariable ["isCompleted", false, true];

diag_log format ["Truck Mission Spawned @ %1", _pos];