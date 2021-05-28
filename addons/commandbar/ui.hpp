class CfgInGameUI {
    class CommandBar {
        left = "(profileNamespace getvariable [""IGUI_GRID_BAR_X"",	(safezoneX + 1 * (((safezoneW / safezoneH) min 1.2) / 40))]) + 2 * safezoneW * (parseNumber !(['commandbar_enabled'] call (uiNamespace getvariable 'grad_minui_fnc_setting')))";
    };
};
