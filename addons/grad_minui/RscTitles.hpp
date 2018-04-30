class RscTitles
{
    class grad_minui
    {
        onLoad = "uiNamespace setVariable ['grad_minui',_this select 0];";
        fadeIn = 0;
        duration = "missionNamespace getVariable ['grad_minui_setting_duration', 2]";
        fadeOut = "missionNamespace getVariable ['grad_minui_setting_fadeOutDuration', 1]";
        idd = -1;
        class controlsBackground {};
        class controls
        {
            class txt
            {
                idc = 1;
                type = 13;
                style = 0;
                colorBackground[] = {0,0,0,0};
                x = 0.7 * safezoneW + safezoneX - pixelW * 5;
                y = safezoneY + pixelH * 5;
                w = 0.3 * safeZoneW;
                h = 0.2 * safeZoneH;
                size = 0.04;
                text = "";
                class Attributes
                {
                    font = "RobotoCondensed";
                    color = "#d8d8d8";
                    align = "right";
                    valign = "top";
                    shadow = false;
                    shadowColor = "#ff0000";
                    size = "0.8";
                };
            }
        };
    };
};
