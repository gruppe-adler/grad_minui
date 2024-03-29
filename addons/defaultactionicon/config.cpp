#include "script_component.hpp"

class CfgPatches {
    class grad_minui_defaultactionicon {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"grad_minui_main", "grad_minui_settings", "A3_Functions_F"};
        authors[] = {"DerZade", "Fusselwurm"};
        VERSION_CONFIG;
    };
};

class MOD_CONFIG_CLASS_NAME {
    #include "cbaSettings.hpp"
};

#include "ui.hpp"
#include "RscTitles.hpp"
#include "CfgFunctions.hpp"
