class CfgInGameUI
{
  class CommandBar {
    left = "(profilenamespace getvariable [""IGUI_GRID_BAR_X"",	(safezoneX + 1 * (((safezoneW / safezoneH) min 1.2) / 40))]) + 2 * safezoneW * (parseNumber !(profileNamespace getVariable ['grad_minui_commandbar_enabled',false]))";
  };
};
