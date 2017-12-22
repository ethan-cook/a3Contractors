/*
	Author: Ethan 'Cookie' Cook, a3Contractors.com
	
	Description:
		Server: Setup databse, and other extDB paramaters, then call server setup.
		Client: Execute players stats init.
	
	Parameter(s):
	N/A
	
	Returns:
	N/A
	
	TODO:
	[*]
*/

if(isServer) then
{
	["a3Contractors", "SQL_CUSTOM", "a3Contractors.ini"] spawn a3C_Server_fnc_extDBinit;
	sleep 3;
	[] call a3C_Server_fnc_serverSetup;
}
else
{
	waitUntil {!(isNil {player}) && player == player && alive player};
	cutText ["Loading in...","BLACK",1];
	
	[player] remoteExec ["a3C_Server_fnc_initStats", 2];
	
	waitUntil {player getVariable ["loadedIn", false]};
	
	cutText ["","plain",1];
	
	[] call a3C_Client_fnc_initInteraction;

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		if ((_this select 1) == 0x29) then
		{
			[] call a3C_Client_fnc_openInteraction;
		};
	}];

	[] call a3C_Client_fnc_hudInit;
};