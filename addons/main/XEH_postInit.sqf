#include "script_component.hpp"

// init keybinds
{
    private _component = configName _x;
    {
        [
            MODDISPLAYNAME,
            format ["grad_minui_%1_%2", _component, configName _x],
            [_x, "title"] call BIS_fnc_returnConfigEntry,
            compile ([_x, "downCode"] call BIS_fnc_returnConfigEntry),
            ""
        ] call CBA_fnc_addKeybind;
    } forEach ("true" configClasses _x);
} forEach ("true" configClasses (configfile >> QUOTE(MOD_CONFIG_CLASS_NAME) >> "keybinds"));
