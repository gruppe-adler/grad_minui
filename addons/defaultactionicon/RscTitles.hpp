class ctrlStructuredText;

class RscTitles {
    class PROGRESS_DISPLAY_CLASS {
        onLoad = "uiNamespace setVariable ['grad_minui_holdAction_progress',_this select 0];";
        fadeIn = 0;
        duration = 200;
        fadeOut = 0;
        idd = -1;
        class controlsBackground {};
        class controls {
            class txt: ctrlStructuredText {
                idc = 1;
                x = "safezoneX + safezoneW / 2 - 0.1";
                y = "safezoneY + safezoneH / 2 - 0.1";
                w = "0.2";
                h = "safezoneH * 0.5";
                class Attributes {
					size = 0.8;
                    align = "center";
                };
            }
        };
    };
};
