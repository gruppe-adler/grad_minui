class RscText;
class RscControlsGroup;

class RscInGameUI
{
  class RscUnitInfo
  {
    class WeaponInfoControlsGroupLeft: RscControlsGroup
    {
      x = "2 * safeZoneW + safezoneX";
    };
  };
  class RscWeaponZeroing: RscUnitInfo
  {
    class CA_Zeroing: RscText
    {
      x = "2 * safeZoneW + safezoneX";
    };
  };
};
