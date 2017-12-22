/*
	Author: Ethan 'Cookie' Cook, www.ExistenceMod.com
	
	Description:
	Creates a updating debug monitor
	
	Parameter(s):
	N/A
	
	Returns:
	N/A
	
	TODO:
	[*]
*/

[] spawn 
{
	while{alive player} do
	{
		hintSilent parseText format 
		[
			"<t size='0.95' align='left' color='#008aef'>Damage: %2</t><br/>
			<t size='0.95' align='left' color='#008aef'>Cash: %1</t><br/>
			<t size='0.95' align='left' color='#008aef'>Bank: %3</t><br/>
			<t size='0.95' align='left' color='#008aef'>Bank Account: %4</t>",
			(player getVariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]]),
			(player getVariable ["cash", 5555]),
			(player getVariable ["bank", 5555]),
			(player getVariable ["bankAccount", 5555])
		];
	};
};