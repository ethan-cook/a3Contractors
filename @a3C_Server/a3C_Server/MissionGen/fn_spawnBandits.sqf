params ["_pos"];

a3C_missionsRun = a3C_missionsRun + 1;
_count = random [0,10,20];
_group = createGroup east;

_missionMarker = createMarker[("Bandits" + str(a3C_missionsRun)), _pos];
_missionMarker setMarkerColor "ColorRed";
_missionMarker setMarkerShape "ELLIPSE";
_missionMarker setMarkerBrush "Solid";
_missionMarker setMarkerSize [150,150];
_missionMarker setMarkerText ("Bandits" + str(a3C_missionsRun));


for "_i" to _count do
{
	_selClass = selectRandom a3C_BanditClass;
	_unitSpawn = _group createUnit [_selClass, _pos, [], 10, "FORM"];
	
	_unitSpawn setVariable ["cash", (random [10,40,100]), true];
};

_lootCrate = "rhs_weapon_crate" createVehicle _pos;
_lootCrate setVariable ["cash", (random [500, 800, 5000]), true];
_lootCrate setVariable ["markerName", ("Bandits" + str(a3C_missionsRun)), true];
_lootCrate setVariable ["isCompleted", false, true];

diag_log format ["Bandit Mission Spawned @ %1", _pos];