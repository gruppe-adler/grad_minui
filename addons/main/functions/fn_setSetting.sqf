/*
 * Function: grad_minui_fnc_setSetting
 * Author: DerZade
 *
 * Sets given setting to given value. This only affects the profileNamespace, which will be overwritten by CBA_settings.
 *
 * Arguments:
 * 0: setting <STRING>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["chat_enabled", true] call grad_minui_fnc_setSetting;
 *
 * Public: No
 */

#include "\grad_minui_main\SETTINGS.hpp"

params ["_setting"];

_setting = toLower _setting;
private _settingWithPre = format ["grad_minui_%1", _setting];

private _defaultIndex = [_SETTINGS, _setting] call BIS_fnc_findInPairs;
if (_defaultIndex isEqualTo -1) exitWith {
  ["No setting '%1'", _setting] call BIS_fnc_error;
};

//if no value is provided -> reset var in profile
if ((count _this) isEqualTo 1) exitWith {
  profileNamespace setVariable [_settingWithPre, nil];
};

//make sure the datatype is coorect
private _defaultValue = (_SETTINGS select _defaultIndex) select 1;
private _value = param [1, nil, [_defaultValue], 4];

profileNamespace setVariable [_settingWithPre, _value];