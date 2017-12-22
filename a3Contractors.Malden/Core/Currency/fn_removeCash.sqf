params ["_amount"];

[player, player getVariable "bankAccount", _amount, 0, 1] remoteExecCall ["a3C_Server_fnc_replicateCurrency", 2];