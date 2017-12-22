/*
	Author: Ethan 'Cookie' Cook, www.ExistenceMod.com
	
	Description:
	Gets corresponding data of the player, then saves it to the database.
	
	Parameter(s):
	N/A
	
	Returns:
	N/A
	
	TODO:
	[*]
*/

for "_i" from 0 to 1 step 0 do {
	sleep 300;
	{
		_uid = getPlayerUID _x;
		
		_check = [0, (format["existPlayerInfo:%1", _uid])] call a3C_Server_fnc_ExtDBquery;
		
		if (!(isNil {_x}) && alive _x && ((_check select 0) select 0) && (_x getVariable ["loadedIn", false])) then {
			_weapons = [];
			if (primaryWeapon _x != "") then {
				_weapons pushBack [0, primaryWeapon _x, primaryWeaponMagazine _x, primaryWeaponItems _x, _x ammo (primaryWeapon _x)];
			};
			if (secondaryWeapon _x != "") then {
				_weapons pushBack [1, secondaryWeapon _x, secondaryWeaponMagazine _x, secondaryWeaponItems _x, _x ammo (secondaryWeapon _x)];
			};
			if (handgunWeapon _x != "") then {
				_weapons pushBack [2, handgunWeapon _x, handgunMagazine _x, handgunItems _x, _x ammo (handgunWeapon _x)];
			};
			
			_updatestr = format ["updatePlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16", name _x, [(uniformItems _x), (vestItems _x), (backpackItems _x), (assignedItems _x)], [(uniform _x), (vest _x), (backpack _x), (headgear _x)], _weapons, getPosATL _x, (_x getVariable ["cash",0]), (_x getVariable ["bank",0]), (_x getVariable "ace_medical_heartRate"), (_x getVariable "ace_medical_bloodPressure"), (_x getVariable "ace_medical_pain"), (_x getVariable "ace_medical_morphine"), (_x getVariable "ace_medical_bloodVolume"), (_x getVariable ["ace_isUnconscious", false]), (_x getVariable "ace_medical_tourniquets"), (_x getVariable "ace_medical_bodyPartStatus"), _uid];
			_update = [0, _updatestr] call a3C_Server_fnc_ExtDBquery;
		};
	}forEach allPlayers;
};