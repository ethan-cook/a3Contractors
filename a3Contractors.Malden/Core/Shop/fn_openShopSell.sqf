params ["_ct"];

closeDialog 0;
createDialog "shopSell";

_array = _ct getVariable "isShop";
_shopName = _array select 0;
_shopItems = _array select 2;
ctrlSetText [1000, _shopName];

{
	_class = _x select 0;
	_price = _x select 1;
	_type = _x select 2;
	_classPriceType = [_class, _price, _type];

	_stringName = "";
	switch (true) do {
	    case (_type == 0 || _type == 2 || _type == 3 || _type == 4 || _type == 5): {
			_stringName = getText(configFile >> "CfgWeapons" >> _class >> "displayName");
		};
	    case (_type == 1): {
			_stringName = getText(configFile >> "CfgMagazines" >> _class >> "displayName");
		};
		case (_type == 6): {
			_stringName = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
		};
	};
	_shopItem = lbAdd [1500, _stringName];
	lbSetData [1500, _shopItem, str _classPriceType];
}forEach _shopItems;

lbSetCurSel [1500, 0];
[]call a3C_Client_fnc_shopRefreshList;
