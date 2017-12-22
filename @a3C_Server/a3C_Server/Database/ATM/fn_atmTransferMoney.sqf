params ["_finalAccount", "_amount", "_player"];

_checkstr = format ["existBankAccount:%1", _finalAccount];
_check = [0, _checkstr] call a3C_Server_fnc_ExtDBquery;
_booli = (_check select 0) select 0;

_fetch = [(format["playerBankBalance:%1", (_player getVariable "bankAccount")]), 2] call a3C_Server_fnc_ExtDBAsync;

if ((((_fetch select 0) select 0) - _amount) < 0) exitWith {
	[str("Not enough bank")] remoteExec ["hint", _player];
};

if (_booli) then {
	_found = objNull;
	{
		if ((_x getVariable "bankAccount") == _finalAccount) then {
			_found = _x;
		};
	}forEach allPlayers;
	if (isNull _found) then {
		[_finalAccount, _amount]call a3C_Server_fnc_atmSendMoney;
	} else {
		_bankAccount = _found getVariable "bankAccount";
		[_found, _bankAccount, _amount, 1, 0]call a3C_Server_fnc_replicateCurrency;
		[str("Transfer Received")] remoteExec ["hint", _found];
	};
	
	[_player, (_player getVariable "bankAccount"), _amount, 0, 0]call a3C_Server_fnc_replicateCurrency;

	[str("Transfer complete.")] remoteExec ["hint", _player];
} else {
	[str("Account not found!")] remoteExec ["hint", _player];
};

_player setVariable ["atmInUse", nil, true];