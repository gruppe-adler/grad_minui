#include "script_component.hpp"

class CfgPatches {
    class grad_minui_commandbar {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"grad_minui_main"};
        authors[] = {"DerZade", "Fusselwurm"};
        VERSION_CONFIG;
    };
};

class grad_minui_cba {
    #include "cbaSettings.hpp"
};

#include "ui.hpp"
