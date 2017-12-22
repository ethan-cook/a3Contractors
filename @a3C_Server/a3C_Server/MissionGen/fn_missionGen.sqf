_worldCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_worldSize = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
_position = _worldCenter nearRoads _worldSize;
_actualPos = [_worldCenter, 1, (_worldSize/2), 0, 0, 45, 0, [[22745.701,200.17395,17040.74], 100], []] call BIS_fnc_findSafePos;


_missions = ["bandits", "truck"];
_selMission = selectRandom _missions;

switch (_selMission) do
{
	case "bandits":
	{	
		[_actualPos] call a3C_Server_fnc_spawnBandits;
	};
	case "truck":
	{
		[_actualPos] call a3C_Server_fnc_spawnTruck;
	};
	default 
	{
		[_actualPos] call a3C_Server_fnc_spawnBandits;
	}
};