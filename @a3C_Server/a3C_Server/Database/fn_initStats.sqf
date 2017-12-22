/*
	Author: Ethan 'Cookie' Cook, a3Contractors.com
	
	Description:
	Retreives player info from database, or creates entry if no matching UID is found.
	
	Parameter(s):
	_player: Player object
	
	Returns:
	N/A
	
	TODO:
	[*]
*/

params ["_player"];

waitUntil {!(isNil{extDB_SQL_CUSTOM_ID})};

_uid = getPlayerUID _player;

_check = [0, (format["existPlayerInfo:%1", _uid])] call a3C_Server_fnc_ExtDBquery;

if ((_check select 0) select 0) then {
	_fetchstr = format ["playerInfo:%1", _uid];
	_fetch = [_fetchstr, 2] call a3C_Server_fnc_ExtDBasync;
	_res = _fetch select 0;

	//ACE Variables
	//_player setVariable ["ace_medical_heartRate", _res select 7, true];
	//_player setVariable ["ace_medical_bloodPressure", _res select 8, true];
	_player setVariable ["ace_medical_pain", _res select 9, true];
	_player setVariable ["ace_medical_morphine", _res select 10, true];
	_player setVariable ["ace_medical_bloodVolume", _res select 11, true];
	_player setVariable ["ace_medical_isUnconscious", _res select 12, true];

	_player setVariable ["cash", _res select 4, true];
	_player setVariable ["bank", _res select 5, true];
	_player setVariable ["backAccount", _res select 6, true];
	
	[_res select 0, _res select 1, _res select 2, _res select 3, _res select 4, _res select 5, _res select 6, _res select 14] remoteExecCall ["a3C_Client_fnc_loadPlayer", _player];
	
} else {
	_insertstr = format["insertPlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14", _uid, name _player, [(uniformItems _player), (vestItems _player), (backpackItems _player), (assignedItems _player)], [(uniform _player), (vest _player), (backpack _player), (headgear _player)], [], getPosATL _player, 80, [80,120], 0, 0, 100, false, [], [0,0,0,0,0,0]];
	_insert = [0, _insertstr] call a3C_Server_fnc_ExtDBquery;
	
	uiSleep 2;
	
	[_player, true] spawn a3C_Server_fnc_initStats;
}