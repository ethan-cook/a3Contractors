params ["_class", "_price", "_amount", "_name", "_uid", "_type"];

switch (_type) do
{
	case "buy":
	{
		_insert = [0, (format["logPurchase:%1:%2:%3:%4:%5", _uid, _name, _amount, _price, _class])] call a3C_Server_fnc_ExtDBquery;
	};
	case "sell":
	{
		_insert = [0, (format["logSale:%1:%2:%3:%4", _uid, _name, _price, _class])] call a3C_Server_fnc_ExtDBquery;
	};
	default
	{
		_insert = [0, (format["logPurchase:%1:%2:%3:%4:%5", _uid, _name, _amount, _price, _class])] call a3C_Server_fnc_ExtDBquery;
	};
};