class RscPicture;

class RscInGameUI
{
  class RscStaminaBar
  {
    class StaminaBar: RscPicture
    {
      x = safezoneX + safeZoneW - pixelW * 5 - 10 * (((safezoneW / safezoneH) min 1.2) / 40);
      y = safezoneY + safezoneH - pixelH * 5 - 0.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
    };
  };
};
