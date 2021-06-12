#include "script_component.hpp"

class CfgPatches {
    class grad_minui_weaponinfo {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"grad_minui_main"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

class MOD_CONFIG_CLASS_NAME {
    #include "cbaSettings.hpp"
    #include "cbaKeybinds.hpp"
};

#include "ui.hpp"
#include "RscTitles.hpp"
#include "CfgFunctions.hpp"
