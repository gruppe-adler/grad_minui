class settings
{
  class commandbar
  {
    categoryName = "$STR_GRAD_MINUI_COMMANDBAR";
    class enabled
    {
      title = "$STR_GRAD_MINUI_COMMANDBAR_ENABLED";
      tooltip = "$STR_GRAD_MINUI_MAIN_MAY_HAVE_TO_RESTART";
      type = "CHECKBOX";
      valueInfo = "false";
      script = "{profileNamespace setVariable ['grad_minui_commandbar_enabled', _this];}";
    };
  };
};
