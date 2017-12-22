params ["_ct"];

[_ct getVariable "cash"] call a3C_Client_fnc_addCash;

_ct setVariable ["cash", nil, true];
deleteVehicle _ct;