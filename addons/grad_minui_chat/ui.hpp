class RscChatListDefault;

class RscChatListMission: RscChatListDefault
{
  w = "(profilenamespace getvariable [""IGUI_GRID_CHAT_W"", (20 *(((safezoneW / safezoneH) min 1.2) / 40))]) * (parseNumber (missionNamespace getVariable ['grad_minui_chat_enabled', false]))";
};
class RscChatListMap: RscChatListDefault
{
  w = "(profilenamespace getvariable [""IGUI_GRID_CHAT_W"",	(20 *(((safezoneW / safezoneH) min 1.2) / 40))]) * (parseNumber (missionNamespace getVariable ['grad_minui_chat_enabled_map',true]))";
};
