/*
 * Function: grad_minui_fnc_setting
 * Author: DerZade
 *
 * Helper function to return value of given setting. First checks missionNamespace (CBA Settings) and then profileNamespace. Fallback to default value.
 *
 * Arguments:
 * 0: setting <STRING>
 *
 * Return Value:
 * setting value <ANY>
 *
 * Example:
 * _isChatEnabled = ["chat_enabled"] call grad_minui_fnc_setting;
 *
 * Public: No
 */

#include "..\SETTINGS.hpp"

params ["_settingName"];

_settingName = toLower _settingName;

private _settingWithPre = format ["grad_minui_%1", _settingName];

private _settingIndex = [_SETTINGS, _settingName] call (uiNamespace getVariable "BIS_fnc_findInPairs");

if (_settingIndex isEqualTo -1) exitWith {
  ["No default value for setting '%1'", _settingName] call (uiNamespace getVariable "BIS_fnc_error");
};

private _defaultValue = (_SETTINGS select _settingIndex) select 1;

private _profile = profileNamespace getVariable [_settingWithPre, _defaultValue];

//return
missionNamespace getVariable [_settingWithPre, _profile];