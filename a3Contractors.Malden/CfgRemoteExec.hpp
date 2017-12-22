#define Function(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec 
{
    class Functions 
	{
        mode = 1;
        jip = 0;

        /* Client functions */
        Function(a3C_Client_fnc_loadPlayer, CLIENT)
        Function(a3C_Client_fnc_addBank, CLIENT)
        Function(a3C_Client_fnc_addCash, CLIENT)

        /* Server functions */
        Function(a3C_Server_fnc_initStats, SERVER)
        Function(a3C_Server_fnc_saveStats, SERVER)
        Function(a3C_Server_fnc_replicateCurrency, SERVER)
		Function(a3C_Server_fnc_confirmCurrency, SERVER)
        Function(a3C_Server_fnc_atmTransferMoney, SERVER)
        Function(a3C_Server_fnc_atmReplicateMoney, SERVER)
        Function(a3C_Server_fnc_logSale, SERVER)

        /* Anyone functions */
        Function(bis_fnc_execvm, ANYONE)
		
    };

    class Commands 
	{
        mode = 1;
        jip = 0;

        Function(call,ANYONE)
        Function(execVM,ANYONE)
    };
};