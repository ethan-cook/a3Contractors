if (player getVariable ["atmInUse", false]) exitWith {hint str("This ATM is currently processing a transaction.")};
player setVariable ["atmInUse", true, true];

_amount = round (parseNumber (ctrlText 1400));

if (_amount > 0) then {
	[_amount, 1] call a3C_Client_fnc_atmRefresh;
	[player, player getVariable "bankAccount", _amount, 1] remoteExecCall ["a3C_Server_fnc_atmReplicateMoney", 2];
} else {
	hint str ("Withdrawl amount must be greater than 0!");
	player setVariable ["atmInUse", nil, true];
};