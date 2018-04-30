class RscPicture;
class RscText;
class RscControlsGroup;

class RscInGameUI
{
    class RscUnitInfo
    {
        class WeaponInfoControlsGroupLeft: RscControlsGroup
        {
            x= 2 * safeZoneW + safezoneX;
        };
    };
    class RscWeaponZeroing: RscUnitInfo
    {
        class CA_Zeroing: RscText
        {
            x= 2 * safeZoneW + safezoneX;
        };
    };

    class RscStaminaBar
    {
        class StaminaBar: RscPicture
        {
            //x = safezoneW * 0.7 + safezoneX - pixelW * 5 - 10 * (((safezoneW / safezoneH) min 1.2) / 40);
            //y = safezoneY + pixelH * 5;
            x = safezoneX;
            y = safezoneY;
            //w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
    };
};
