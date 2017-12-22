diag_log "Executing a3 Contractors server side scripts";

//Players
addMissionEventHandler ["HandleDisconnect",{ _this call a3C_Server_fnc_saveStats; deleteVehicle (_this select 0); }];
[] spawn a3C_Server_fnc_saveStatsLoop;

diag_log "Database established.";

[] call a3C_Server_fnc_initShops;

diag_log "Shops setup.";

[] call a3C_Server_fnc_missionConfig;
diag_log "Misions setup.";

[] call a3C_Server_fnc_serverRestart;