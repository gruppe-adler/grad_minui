#include "script_component.hpp"

class CfgPatches {
    class grad_minui_compat_ace {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"grad_minui_main","ace_advanced_fatigue"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

#include "ui.hpp"
