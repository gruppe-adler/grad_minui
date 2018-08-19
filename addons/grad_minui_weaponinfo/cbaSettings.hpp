class settings
{
  class weaponInfo
  {
    categoryName = "$STR_GRAD_MINUI_WEAPONINFO";
    class showOnGetOut
    {
      title = "$STR_GRAD_MINUI_WEAPONINFO_SHOWONGETOUT";
      type = "CHECKBOX";
      valueInfo = "true";
      tooltip = "$STR_GRAD_MINUI_WEAPONINFO_SHOWONGETOUT_TIP";
    };
    class showOnGetIn
    {
      title = "$STR_GRAD_MINUI_WEAPONINFO_SHOWONGETIN";
      type = "CHECKBOX";
      valueInfo = "true";
      tooltip = "$STR_GRAD_MINUI_WEAPONINFO_SHOWONGETIN_TIP";
    };
    class duration
    {
      title = "$STR_GRAD_MINUI_WEAPONINFO_DURATION";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 2, 1]";
      tooltip = "$STR_GRAD_MINUI_WEAPONINFO_DURATION_TIP";
    };
    class fadeOutDuration
    {
      title = "$STR_GRAD_MINUI_WEAPONINFO_FADEOUTDURATION";
      type = "SLIDER";
      valueInfo = "[0.1, 10, 1, 1]";
      tooltip = "$STR_GRAD_MINUI_WEAPONINFO_FADEOUTDURATION_TIP";
    };
    class color
    {
      title = "$STR_GRAD_MINUI_WEAPONINFO_COLOR";
      type = "COLOR";
      valueInfo = "[0.85, 0.85, 0.85, 1]";
      tooltip = "$STR_GRAD_MINUI_WEAPONINFO_COLOR_TIP";
      script = "{profileNameSpace setVariable ['grad_minui_setting_color_hex', _this call BIS_fnc_colorRGBAtoHTML];}";
    };
  };
};
