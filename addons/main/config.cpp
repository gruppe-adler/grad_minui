#include "script_component.hpp"

class CfgPatches {
    class grad_minui_main {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.02;
        requiredAddons[] = {"A3_Data_F_Tank_Loadorder"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    class grad_minui_main {
        init = "call compile preprocessFileLineNumbers 'x\grad_minui\addons\main\XEH_preInit.sqf'";
    };
};