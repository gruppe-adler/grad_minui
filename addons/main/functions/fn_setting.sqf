/*
 * Function: grad_minui_fnc_setting
 * Author: DerZade
 *
 * Helper function to return value of given setting. First checks missionNamespace (CBA Settings) and then profileNamespace. Fallback to default value.
 *
 * Arguments:
 * 0: Setting <STRING>
 *
 * Return Value:
 * Setting value <ANY>
 *
 * Example:
 * _isChatEnabled = ["chat_enabled"] call grad_minui_fnc_setting;
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
    ["Could not find setting '%1'", _setting] call (uiNamespace getVariable "BIS_fnc_error");
    nil;
};

private _defaultValue = _SETTINGS get _setting;

private _profile = profileNamespace getVariable [_settingWithPrefix, _defaultValue];

// return
missionNamespace getVariable [_settingWithPrefix, _profile];