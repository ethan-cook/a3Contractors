disableSerialization;
for "_i" from 0 to 1 step 0 do {
	_hud = uiNamespace getVariable ["HUD",displayNull];

	if(isNull _hud) then 
	{
		2 cutRsc ["HUD","PLAIN"];
	};
	
	(_hud displayCtrl 1001) ctrlSetText (str (player getVariable "ace_medical_bodyPartStatus"));
	
	(_hud displayCtrl 1000) ctrlSetText (str (player getVariable "cash"));
	
	(_hud displayCtrl 1002) ctrlSetText (str (player getVariable "bank"));
	
	(_hud displayCtrl 1003) ctrlSetText (str (player getVariable "bankAccount"));
	
	sleep 0.5;
};
