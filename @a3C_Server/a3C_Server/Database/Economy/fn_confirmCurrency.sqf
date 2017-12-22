params ["_player", "_localBank", "_localCash"];

_fetch = [(format["playerMoney:%1", (_player getVariable "bankAccount")]), 2] call a3C_Server_fnc_ExtDBAsync;

if (_localBank != ((_fetch select 0) select 1)) then {
	_player setVariable ["bank", ((_fetch select 0) select 1), true];
	diag_log format["Economy error: %1 had a mismatch of money.", getPlayerUID _player];
};
if (_localCash != ((_fetch select 0) select 0)) then {
	_player setVariable ["cash", ((_fetch select 0) select 0), true];
	diag_log format["Economy error: %1 had a mismatch of money.", getPlayerUID _player];
};