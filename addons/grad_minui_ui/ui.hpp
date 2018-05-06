class RscPicture;
class RscText;
class RscControlsGroupNoScrollbars;
class RscControlsGroup;

class RscInGameUI
{
    class RscUnitInfo
    {
      class WeaponInfoControlsGroupLeft: RscControlsGroup
      {
          x = 2 * safeZoneW + safezoneX;
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
