/*
 * Function: grad_minui_fnc_setSetting
 * Author: DerZade
 *
 * Set setting to given value. This only affects the profileNamespace, which will be overwritten by CBA settings.
 *
 * Arguments:
 * 0: Setting <STRING>
 * 1: Value <ANY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["chat_enabled", true] call grad_minui_fnc_setSetting;
 *
 * Public: No
 */

#include "..\SETTINGS.hpp"

params [
    ["_setting", "", [""]]
];

_setting = toLower _setting;
private _settingWithPrefix = format ["grad_minui_%1", _setting];

if !(_setting in _SETTINGS) exitWith {
    ["Could not find setting '%1'", _setting] call BIS_fnc_error;
    nil;
};

// if no value is provided -> reset var in profile
if ((count _this) isEqualTo 1) exitWith {
    profileNamespace setVariable [_settingWithPrefix, nil];
};

// make sure the datatype is coorect
private _defaultVal = _SETTINGS get _setting;
private _value = param [1, nil, [_defaultVal], 4];

profileNamespace setVariable [_settingWithPrefix, _value];