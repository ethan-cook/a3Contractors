class shopSell
{
	idd = 1018;
	class controls
	{
		class RscFrame_1800: RscText
		{
			idc = 1800;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.26909 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.483811 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "";
			x = 0.419792 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.408333 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.194792 * safezoneW;
			h = 0.241906 * safezoneH;
			onLbSelChanged = []call a3C_Client_fnc_shopRefreshList;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Value:";
			x = 0.414063 * safezoneW + safezoneX;
			y = 0.587966 * safezoneH + safezoneY;
			w = 0.0572917 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "";
			x = 0.477083 * safezoneW + safezoneX;
			y = 0.587966 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Sell";
			x = 0.408333 * safezoneW + safezoneX;
			y = 0.686927 * safezoneH + safezoneY;
			w = 0.1916667 * safezoneW;
			h = 0.0439828 * safezoneH;
			action = []call a3C_Client_fnc_shopSell;
		};
	};
};