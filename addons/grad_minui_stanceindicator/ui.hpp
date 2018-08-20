class RscPicture;
class RscPictureKeepAspect;

class RscInGameUI
{
  class RscStanceInfo
  {
    class StanceIndicatorBackground: RscPicture
    {
      w="(3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) * (parseNumber (['stanceIndicator_enabled'] call (uinamespace getvariable 'grad_minui_fnc_setting')))";
    };
    class StanceIndicator: RscPictureKeepAspect
    {
      w="(3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) * (parseNumber (['stanceIndicator_enabled'] call (uinamespace getvariable 'grad_minui_fnc_setting')))";
    };
  };
};
