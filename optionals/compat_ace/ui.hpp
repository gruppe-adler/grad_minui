class RscControlsGroupNoScrollbars;

class ace_advanced_fatigue_StaminaBarContainer: RscControlsGroupNoScrollbars {
    x = "safezoneX + safeZoneW - pixelW * 5 - 10 * (((safezoneW / safezoneH) min 1.2) / 40)";
    y = "safezoneY + safezoneH - pixelH * 5 - 0.15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};
