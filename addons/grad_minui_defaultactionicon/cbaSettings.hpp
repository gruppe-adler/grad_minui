class settings
{
  class defaultactionicon
  {
    categoryName = "$STR_GRAD_MINUI_DEFAULTACTIONICON";
    class size
    {
      title = "$STR_GRAD_MINUI_DEFAULTACTIONICON_SIZE";
      type = "SLIDER";
      valueInfo = "[0, 2, 0.8, 2]";
      tooltip = "$STR_GRAD_MINUI_MAIN_MAY_HAVE_TO_RESTART";
      script = "{profileNameSpace setVariable ['grad_minui_defaultactionicon_size', _this];}";
    };
  };
};
