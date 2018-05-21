class settings
{
  class weaponInfo
  {
    categoryName = "Weapon Info";
    class showOnGetOut
    {
      title = "Show when getting out of Vehicle";
      type = "CHECKBOX";
      valueInfo = "true";
      tooltip = "Show whole weaponInfo automatically when getting out of a vehicle.";
    };
    class showOnGetIn
    {
      title = "Show when getting into Vehicle";
      type = "CHECKBOX";
      valueInfo = "true";
      tooltip = "Show whole weaponInfo automatically when getting into a vehicle.";
    };
    class duration
    {
      title = "Duration";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 2, 1]";
      tooltip = "Show duration of weaponInfo.";
    };
    class fadeOutDuration
    {
      title = "Fadeout Duration";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 1, 1]";
      tooltip = "Fadeout duration of weaponInfo.";
    };
    class color
    {
      title = "Color";
      type = "COLOR";
      valueInfo = "[0.85, 0.85, 0.85, 1]";
      tooltip = "WeaponInfo color.";
      script = "{profileNameSpace setVariable ['grad_minui_setting_color_hex', _this call BIS_fnc_colorRGBAtoHTML];}";
    };
  };
};
