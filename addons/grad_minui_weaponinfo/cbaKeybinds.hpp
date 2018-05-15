class keybinds
{
  class weaponInfo
  {
    class all
    {
      title = "Show whole WeaponInfo";
      downCode = "{[] spawn {sleep 0.03; ['all'] call grad_minui_fnc_showWeaponInfo;}}";
    };
    class zeroing
    {
      title = "Show Current Zeroing";
      downCode = "{[] spawn {sleep 0.03; ['zeroing'] call grad_minui_fnc_showWeaponInfo;}}";
    };
    class mode
    {
      title = "Show Current Weaponmode";
      downCode = "{[] spawn {sleep 0.03; ['mode'] call grad_minui_fnc_showWeaponInfo;}}";
    };
    class throwable
    {
      title = "Show Current Throwable";
      downCode = "{[] spawn {sleep 0.03; ['throwable'] call grad_minui_fnc_showWeaponInfo;}}";
    };
    class magazine
    {
      title = "Show Current Magazine";
      downCode = "{[] spawn {sleep 0.03; ['magazine'] call grad_minui_fnc_showWeaponInfo;}}";
    };
  };
};
