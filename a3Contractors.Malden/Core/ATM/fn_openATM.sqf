createDialog "ATM";

_bankAccount = format ["Bank Account: %1", str (player getVariable "bankAccount")]; 
ctrlSetText [1000, _bankAccount];

_bank = str (player getVariable "bank"); 
ctrlSetText [1002, _bank];

_cash = str (player getVariable "cash"); 
ctrlSetText [1004, _cash];