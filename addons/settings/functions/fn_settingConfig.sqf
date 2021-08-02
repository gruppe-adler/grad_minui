#include "script_component.hpp"

/*
 * Function: grad_minui_fnc_settingConfig
 * Author: DerZade
 *
 * Find config class for setting name. This iterates all settings of all components to find
 * the correspondig config class.
 *
 * Arguments:
 * 0: Setting <STRING>
 *
 * Return Value:
 * Setting config (configNull if not found) <CONFIG>
 *
 * Example:
 * _config = ["chat_enabled"] call grad_minui_fnc_settingConfig;
 *
 * Public: No
 */
params [
    ["_setting", "", [""]]
];

_setting = toLower _setting;
private _config = configNull;

{
    if !(isNull _config) exitWith {}; // exit loop if config has been found

    private _component = toLower configName _x;

    // if our setting does not start with "<COMPONENT>_"
    // it can not be found in this class
    if ((_setting find (_component + "_")) isNotEqualTo 0) then {continue};

    {
        private _id = toLower format ["%1_%2", _component, configName _x];
        if (_id isEqualTo _setting) exitWith {
            _config = _x;
        };
    } forEach("true" configClasses _x);
} forEach("true" configClasses (configfile >> QUOTE(MOD_CONFIG_CLASS_NAME) >> "settings"));

_config;
