class RscChatListDefault;

class RscChatListMission: RscChatListDefault {
    w = "(profileNamespace getvariable [""IGUI_GRID_CHAT_W"", (20 *(((safezoneW / safezoneH) min 1.2) / 40))]) * parseNumber (['chat_enabled'] call (uiNamespace getvariable 'grad_minui_fnc_setting'))";
};
class RscChatListMap: RscChatListDefault {
    w = "(profileNamespace getvariable [""IGUI_GRID_CHAT_W"", (20 *(((safezoneW / safezoneH) min 1.2) / 40))])  * parseNumber (['chat_enabled_map'] call (uiNamespace getvariable 'grad_minui_fnc_setting'))";
};
