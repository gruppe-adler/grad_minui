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
params [
    ["_setting", "", [""]]
];

with uiNamespace do {
    private _setting = toLower _setting;

    private _settingWithPrefix = format ["grad_minui_%1", _setting];

    private _mission = missionNamespace getVariable _settingWithPrefix;
    if !(isNil "_mission") exitWith {
        _mission
    };

    private _profile = profileNamespace getVariable _settingWithPrefix;
    if !(isNil "_profile") exitWith {
        _profile
    };

    [_setting] call grad_minui_fnc_settingDefault;
};