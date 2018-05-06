class RscPicture;
class RscText;
class RscControlsGroupNoScrollbars;
class RscControlsGroup;

class RscInGameUI
{
    class RscUnitInfo
    {
        class WeaponInfoControlsGroupRight: RscControlsGroup
        {
            w = 0;
            h = 0;
            zarrck = "super cool";
            class controls
            {
              class CA_BackgroundWeapon: RscPicture
              {
                zarrck = "super cool";
                w = 0;
                h = 0;
                text = "";
              }
            }
        };
    };
    class RscWeaponZeroing
    {
        class CA_Zeroing: RscText
        {
            x = 2 * safeZoneW + safezoneX;
        };
    };

    class RscStaminaBar
    {
        class StaminaBar: RscPicture
        {
            x = safezoneX + safeZoneW - pixelW * 5 - 10 * (((safezoneW / safezoneH) min 1.2) / 40);
            y = safezoneY + safezoneH - pixelH * 5 - 0.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
        };
    };
};

class ace_advanced_fatigue_StaminaBarContainer: RscControlsGroupNoScrollbars
{
    x = safezoneX + safeZoneW - pixelW * 5 - 10 * (((safezoneW / safezoneH) min 1.2) / 40);
    y = safezoneY + safezoneH - pixelH * 5 - 0.15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
};
