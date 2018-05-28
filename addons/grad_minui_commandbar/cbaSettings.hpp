class settings
{
  class commandbar
  {
    categoryName = "Command Bar";
    class enabled
    {
      title = "Show vanilla commandBar";
      tooltip = "You may need to restart your game to apply this setting.";
      type = "CHECKBOX";
      valueInfo = "false";
      script = "{profileNamespace setVariable ['grad_minui_commandbar_enabled', _this];}";
    };
  };
};
