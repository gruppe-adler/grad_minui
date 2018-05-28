class settings
{
  class defaultactionicon
  {
    categoryName = "DefaultAction Icon";
    class size
    {
      title = "DefaultAction Icon Size";
      type = "SLIDER";
      valueInfo = "[0, 2, 0.8, 2]";
      tooltip = "You may need to restart your game to apply this setting.";
      script = "{profileNameSpace setVariable ['grad_minui_defaultactionicon_size', _this];}";
    };
  };
};
