params ["_type", "_amount"];

[player, player getVariable "bank", player getVariable "cash"] remoteExecCall ["a3C_Server_fnc_confirmCurrency", 2];

_return = false;
if (_type == 1) then {
	if (((player getVariable "cash") - _amount) >= 0) then {_return = true}
} else {
	if (((player getVariable "bank") - _amount) >= 0) then {_return = true}
};

_return