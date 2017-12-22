params ["_target", "_giver"];

_amount = parseNumber (ctrlText 1401);
closeDialog 0;

if (_amount > 0) then {
	if ([1, _amount] call a3C_Client_fnc_checkCash) then {
		[_amount] call a3C_Client_fnc_removeCash;
		[_amount] remoteExecCall ["a3C_Client_fnc_addCash", _target];

		[format["%1 gave you %2", _giver, _amount]] remoteExec ["hint", _target];
	} else {
		hint str("You do not have enough cash.");
	};
} else {
	hint str ("Enter an amount greater than zero!");
};