_index = lbCurSel 1500;
_data = lbData [1500, _index];
_dataArray = call compile _data;
_class = _dataArray select 0;
_price = _dataArray select 1;
_type = _dataArray select 2;

switch (_type) do {
	case 0: {
		if (_class in (items player)) then {
			player removeItem _class;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	case 1: {
		if (_class in (magazines player)) then {
			player removeMagazine _class;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};	
	};
	case 2: {
		if (_class in (weapons player)) then {
			player removeWeapon _class;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	case 3: {
		if (_class == uniform player) then {
			removeUniform player;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	case 4: {
		if (_class == vest player) then {
			removeVest player;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	case 5: {
		if (_class == headgear player) then {
			removeHeadgear player;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	case 6: {
		if (_class == backpack player) then {
			removeBackpack player;
			[_price] call a3C_Client_fnc_addCash;
			hint str("You have sold an item!");
		} else {
			hint str("You don't have that!");
		};
	};
	default { hint "Error >> Item does have a defined type"; closeDialog 0; };
};

_name = name player;
_uid = getPlayerUID player;
_amount = 1;

[_class, _price, _amount, _name, _uid, "sell"] remoteExec ["a3C_Server_fnc_logSale", 2];