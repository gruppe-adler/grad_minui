/*
 * Function: grad_minui_fnc_registerCBASettings
 * Author: DerZade
 *
 * Called by pre init. Registers all CBA keybinds.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */
#include "../script_component.hpp"

if !(isClass(configFile >> "CfgPatches" >> "cba_keybinding")) exitWith {};

{
    private _component = configName _x;
    {
        [
            MODDISPLAYNAME,
            format ["grad_minui_%1_%2", _component, configName _x],
            [_x, "title"] call BIS_fnc_returnConfigEntry,
            call compile ([_x, "downCode"] call BIS_fnc_returnConfigEntry),
            ""
        ] call CBA_fnc_addKeybind;
    } forEach ("true" configClasses _x);
} forEach ("true" configClasses (configfile >> "grad_minui_cba" >> "keybinds"));
