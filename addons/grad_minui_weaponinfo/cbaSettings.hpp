class settings
{
  class weaponInfo
  {
    class showOnGetOut
    {
      title = "Show whole WeaponInfo when getting out of Vehicle";
      type = "CHECKBOX";
      valueInfo = "true";
    };
    class showOnGetIn
    {
      title = "Show whole WeaponInfo when getting into Vehicle";
      type = "CHECKBOX";
      valueInfo = "true";
    };
    class duration
    {
      title = "WeaponInfo Duration";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 2, 1]";
    };
    class fadeOutDuration
    {
      title = "WeaponInfo Fade Out Duration";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 1, 1]";
    };
    class color
    {
      title = "WeaponInfo Color";
      type = "COLOR";
      valueInfo = "[0.85, 0.85, 0.85, 1]";
      script = "{profileNameSpace setVariable ['grad_minui_setting_color_hex', _this call BIS_fnc_colorRGBAtoHTML];}";
    };
  };
};
