class CfgPatches
{
    class a3C_Server
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {};
    };
};

#include "Shop\shopConfig.hpp"

class CfgFunctions
{
    class a3C_Server
    {
        tag = "a3C_Server";
        class init
        {
            file = "a3C_Server";
            class serverSetup {};
            class serverRestart {};
        };
        class Database
        {
            file = "a3C_Server\Database";
            class extDBASync {};
            class extDBinit {};
            class extDBQuery {};
            class extDBStrip {};
            class initStats {};
            class saveStats {};
            class saveStatsLoop {};
        };
        class Economy 
        {
            file = "a3C_Server\Database\Economy";
            class confirmCurrency {};
            class replicateCurrency {};
            class logSale {};
        };
        class ATM
        {
            file = "a3C_Server\Database\ATM";
            class atmSendMoney {};
            class atmReplicateMoney {};
            class atmTransferMoney {};
        };
        class Shop
        {
            file = "a3C_Server\Shop";
            class initShops {};
        };
        class MissionGen
        {
            file = "a3C_Server\MissionGen";
            class missionConfig {};
            class missionGen {};
            class spawnBandits {};
            class spawnTruck {};
        };
    };
};