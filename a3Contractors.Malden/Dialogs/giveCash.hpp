class giveCash
{
	idd = 1010;
	class controls 
	{
		class RscFrame_1800: RscText
		{
			idc = 1800;
			x = 0.40375 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.1925 * safezoneW;
			h = 0.30788 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = $STR_RPF_CORE_GIVECASH_AMT;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.09625 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = $STR_RPF_CORE_GIVECASH_GIVE;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.0549786 * safezoneH;
			action = [a3C_cashGiveTarget, player]call a3C_Client_fnc_giveCashSubmit;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.390043 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
	};
};