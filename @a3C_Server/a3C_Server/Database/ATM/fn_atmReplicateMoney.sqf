params ["_player", "_id", "_amount", "_type"];

_fetch = [(format["playerMoney:%1", _id]), 2] call a3C_Server_fnc_ExtDBAsync;
_res = _fetch select 0;
_cash = _res select 0;
_bank = _res select 1;

_newBank = 0;
_newCash = 0;
if (_type == 0) then {
	_newBank = _bank - _amount;
	_newCash = _cash + _amount;
} else {
	_newCash = _cash - _amount;
	_newBank = _bank + _amount;
};

if ((_newBank < 0) || (_newCash < 0)) exitWith {_player setVariable ["atmInUse", nil, true];};

_insert = [0, (format["updatePlayerMoney:%1:%2:%3", _newCash, _newBank, _id])] call a3C_Server_fnc_ExtDBquery;
_player setVariable ["bank", _newBank, true];
_player setVariable ["cash", _newCash, true];

_player setVariable ["atmInUse", nil, true];