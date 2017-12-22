/*
	Author: Ethan 'Cookie' Cook, a3Contractors.com
	
	Description:
	Select a random item from an array, taking into account item weights.
	Then spawn selected item, for each bulding.
	
	Parameter(s):
	_this select 0 = _items array from database.
	_this select 1 = _clothes array from database.
	_this select 2 = _weapons array from database.
	_this select 3 = _position array from database.
	_this select 4 = _bodyPartStatus array from database.
	
	Returns:
	N/A
	
	TODO:
    [*] Earplugs
*/
params ["_items", "_clothes", "_weapons", "_position", "_cash", "_bank", "_bankAccount", "_bodyPartStatus"];

player setPosATL _position;

removeAllItems player;
removeAllContainers player;
removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

if ((count _weapons) > 0) then {
	{
		switch (_x select 0) do {
			case 0: {
				player addWeapon (_x select 1);
				player addPrimaryWeaponItem ((_x select 2) select 0);
				{player addPrimaryWeaponItem _x;}count (_x select 3);
				player setAmmo [primaryWeapon player, (_x select 4)];
			};
			case 1: {
				player addWeapon (_x select 1);
				player addSecondaryWeaponItem ((_x select 2) select 0);
				{player addSecondaryWeaponItem _x;}count (_x select 3);
				player setAmmo [secondaryWeapon player, (_x select 4)];
			};
			case 2: {
				player addWeapon (_x select 1);
				player addHandgunItem ((_x select 2) select 0);
				{player addHandgunItem _x;}count (_x select 3);
				player setAmmo [handgunWeapon player, (_x select 4)];
			};
		};
	}forEach _weapons;
};

player addUniform (_clothes select 0);
player addVest (_clothes select 1);
player addBackpack (_clothes select 2);
player addHeadgear (_clothes select 3);

{player addItemToUniform _x}count (_items select 0);
{player addItemToVest _x}count (_items select 1);
{player addItemToBackpack _x}count (_items select 2);
{player addItem _x; player assignItem _x}count (_items select 3);

_headDamage = _bodyPartStatus select (["head"] call ace_medical_fnc_selectionNameToNumber);
_bodyDamage = _bodyPartStatus select (["body"] call ace_medical_fnc_selectionNameToNumber);
_larmDamage = _bodyPartStatus select (["hand_l"] call ace_medical_fnc_selectionNameToNumber);
_rarmDamage = _bodyPartStatus select (["hand_r"] call ace_medical_fnc_selectionNameToNumber);
_rlegDamage = _bodyPartStatus select (["leg_r"] call ace_medical_fnc_selectionNameToNumber);
_llegDamage = _bodyPartStatus select (["leg_l"] call ace_medical_fnc_selectionNameToNumber);

[player, _headDamage, "head", "unknown"] call ace_medical_fnc_addDamageToUnit;
[player, _bodyDamage, "body", "unknown"] call ace_medical_fnc_addDamageToUnit;
[player, _larmDamage, "hand_l", "unknown"] call ace_medical_fnc_addDamageToUnit;
[player, _rarmDamage, "hand_r", "unknown"] call ace_medical_fnc_addDamageToUnit;
[player, _rlegDamage, "leg_r", "unknown"] call ace_medical_fnc_addDamageToUnit;
[player, _llegDamage, "leg_l", "unknown"] call ace_medical_fnc_addDamageToUnit;

[player, "head", _headDamage, ObjNull, "unknown"] call ace_medical_fnc_handleDamage_wounds;
[player, "body", _bodyDamage, ObjNull, "unknown"] call ace_medical_fnc_handleDamage_wounds;
[player, "hand_l", _larmDamage, ObjNull,"unknown"] call ace_medical_fnc_handleDamage_wounds;
[player, "hand_r", _rarmDamage, ObjNull,"unknown"] call ace_medical_fnc_handleDamage_wounds;
[player, "leg_r", _rlegDamage, ObjNull,"unknown"] call ace_medical_fnc_handleDamage_wounds;
[player, "leg_l", _llegDamage, ObjNull, "unknown"] call ace_medical_fnc_handleDamage_wounds;

player setVariable ["cash", _cash, true];
player setVariable ["bank", _bank, true];
player setVariable ["bankAccount", _bankAccount, true];


player setVariable ["loadedIn", true, true];