_mC = "a3C_Shops";

{
	_className = (configFile >> _mC >> _x >> "className") call BIS_fnc_getCfgData;
	_pos = (configFile >> _mC >> _x >> "pos") call BIS_fnc_getCfgData;
	_dir = (configFile >> _mC >> _x >> "dir") call BIS_fnc_getCfgData;
	_shopName = (configFile >> _mC >> _x >> "shopName") call BIS_fnc_getCfgData;
	_buyItems = (configFile >> _mC >> _x >> "buyItems") call BIS_fnc_getCfgData;
	_sellItems = (configFile >> _mC >> _x >> "sellItems") call BIS_fnc_getCfgData;

	_store = _className createVehicle [0,0,0];
	_store setPosATL _pos;
	_store setDir _dir;
	_store allowDamage false;

	diag_log format ["class %1 Pos %2 Dir %3 Shopname %4", _className, _pos, _dir, _shopName];
	
	_store setVariable ["isShop", [_shopName,_buyItems,_sellItems], true];
}forEach ((configFile >> _mC >> "shops") call BIS_fnc_getCfgData);
