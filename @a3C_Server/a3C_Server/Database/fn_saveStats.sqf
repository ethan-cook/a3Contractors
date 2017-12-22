/*
	Author: Ethan 'Cookie' Cook, a3Contractors.com
	
	Description:
	Gets corresponding data of the player, then saves it to the database.
	
	Parameter(s):
	_player = player object to save.
	_uid = player UID.
	_name = name of player.
	
	Returns:
	N/A
	
	TODO:
	[*]
*/
params ["_player", "_id", "_uid", "_name"];

_weapons = [];
if (primaryWeapon _player != "") then {
	_weapons pushBack [0, primaryWeapon _player, primaryWeaponMagazine _player, primaryWeaponItems _player, _player ammo (primaryWeapon _player)];
};
if (secondaryWeapon _player != "") then {
	_weapons pushBack [1, secondaryWeapon _player, secondaryWeaponMagazine _player, secondaryWeaponItems _player, _player ammo (secondaryWeapon _player)];
};
if (handgunWeapon _player != "") then {
	_weapons pushBack [2, handgunWeapon _player, handgunMagazine _player, handgunItems _player, _player ammo (handgunWeapon _player)];
};


_updatestr = format ["updatePlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16", name _player, [(uniformItems _player), (vestItems _player), (backpackItems _player), (assignedItems _player)], [(uniform _player), (vest _player), (backpack _player), (headgear _player)], _weapons, getPosATL _player, (_player getVariable ["cash",0]), (_player getVariable ["bank",0]), (_player getVariable "ace_medical_heartRate"), (_player getVariable "ace_medical_bloodPressure"), (_player getVariable "ace_medical_pain"), (_player getVariable "ace_medical_morphine"), (_player getVariable "ace_medical_bloodVolume"), (_player getVariable ["ace_isUnconscious", false]), (_player getVariable "ace_medical_tourniquets"), (_player getVariable "ace_medical_bodyPartStatus"), _uid];
_update = [0, _updatestr] call a3C_Server_fnc_ExtDBquery;