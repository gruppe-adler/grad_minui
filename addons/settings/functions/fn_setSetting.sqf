/*
 * Function: grad_minui_fnc_setSetting
 * Author: DerZade
 *
 * Set setting to given value. This only affects the profileNamespace, which will be overwritten by CBA settings.
 *
 * Arguments:
 * 0: Setting <STRING>
 * 1: Value (Optional; if nil setting will be reset to default) <ANY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["chat_enabled", true] call grad_minui_fnc_setSetting;
 *
 * Public: No
 */
params [
    ["_setting", "", [""]]
];

_setting = toLower _setting;
private _settingWithPrefix = format ["grad_minui_%1", _setting];

// if no value is provided -> reset var in profile
if ((count _this) isEqualTo 1) exitWith {
    profileNamespace setVariable [_settingWithPrefix, nil];
    saveProfileNamespace;
};

private _default = [_setting] call grad_minui_fnc_settingDefault;
if (isNil "_default") exitWith {}; // nil -> setting does not exists; settingDefault will show error

// make sure the datatype is correct
private _value = param [1, nil, [_default]];

profileNamespace setVariable [_settingWithPrefix, _value];
saveProfileNamespace;