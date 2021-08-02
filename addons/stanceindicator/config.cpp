#include "script_component.hpp"

class CfgPatches {
    class grad_minui_stanceindicator {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"grad_minui_main", "grad_minui_settings"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

#include "ui.hpp"

class MOD_CONFIG_CLASS_NAME {
    #include "cbaSettings.hpp"
};
