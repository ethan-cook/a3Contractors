params ["_amount"];

[player, player getVariable "bankAccount", _amount, 1, 0] remoteExecCall ["a3C_Server_fnc_replicateCurrency", 2];