if (player getVariable ["atmInUse", false]) exitWith {hint str("This ATM is currently processing a transaction.")};
player setVariable ["atmInUse", true, true];

_amount = parseNumber (ctrlText 1401);
_account = parseNumber (ctrlText 1402);

if (_amount <= 0) exitWith {
	hint str("Invalid amount.");
};

if (player getVariable "bankAccount" == _account) exitWith {
	hint str("You can not transfer to yourself.");
};
_nBank = ((player getVariable "bank") - _amount);
if (_nBank < 0) exitWith {hint str("Not enough bank balance!")};

ctrlSetText [1002, str _nBank];

[_account, _amount, player] remoteExecCall ["a3C_Server_fnc_transferMoney", 2];
