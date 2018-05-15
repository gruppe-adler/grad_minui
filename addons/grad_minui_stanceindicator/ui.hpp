class RscPicture;
class RscPictureKeepAspect;

class RscInGameUI
{
  class RscStanceInfo
  {
    class StanceIndicatorBackground: RscPicture
    {
      w="(3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) * (parseNumber (missionNamespace getVariable ['grad_minui_stanceIndicator_enabled',true]))";
    };
    class StanceIndicator: RscPictureKeepAspect
    {
      w="(3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) * (parseNumber (missionNamespace getVariable ['grad_minui_stanceIndicator_enabled',true]))";
    };
  };
};
