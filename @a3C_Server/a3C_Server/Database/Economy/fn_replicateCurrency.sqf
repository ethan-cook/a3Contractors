params ["_player", "_id", "_amount", "_type", "_cashOrBank"];

_fetch = [];
if (_cashOrBank == 0) then {
	_fetch = [(format["playerBankBalance:%1", _id]), 2] call a3C_Server_fnc_ExtDBAsync;
} else {
	_fetch = [(format["playerCashBalance:%1", _id]), 2] call a3C_Server_fnc_ExtDBAsync;
};
_oldBalance = ((_fetch select 0) select 0);

_newBalance = nil;
if (_type == 0) then {
	_newBalance = _oldBalance - _amount;
} else {
	_newBalance = _oldBalance + _amount;
};

if (_newBalance < 0) exitWith {};

if (_cashOrBank == 0) then {
	_insert = [0, (format["updatePlayerBalance:%1:%2", _newBalance, _id])] call a3C_Server_fnc_ExtDBquery;
	_player setVariable ["bank", _newBalance, true];
} else {
	_insert = [0, (format["updatePlayerCash:%1:%2", _newBalance, _id])] call a3C_Server_fnc_ExtDBquery;
	_player setVariable ["cash", _newBalance, true];
};