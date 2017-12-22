a3C_InteractionButtons = [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608];
a3C_InteractionItems = [
	[
		["isPlayer cursorObject", "(player distance cursorObject) <= 5"],
		["Give Cash", "[cursorObject] call a3C_Client_fnc_giveCash"]
	],
	[
		["!(isNil {cursorObject getVariable 'cash'})", "(player distance cursorObject) <= 5"],
		["Take Cash", "[cursorObject] call a3C_Client_fnc_takeCash"]
	],
	[
		["!(isNil {cursorObject getVariable 'atm'})", "(player distance cursorObject) <= 5"],
		["Open ATM", "[cursorObject] call a3C_Client_fnc_openATM"]
	],
	[
		["!(isNil {cursorObject getVariable 'isShop'})", "(player distance cursorObject) <= 5"],
		["Open Shop", "[cursorObject] call a3C_Client_fnc_openShop"]
	],
	[
		["(cursorObject getVariable 'isComplete') == false", "(player distance cursorObject) <= 5"],
		["Complete Mission", "[cursorObject] call a3C_Client_fnc_completeMission"]
	]
];