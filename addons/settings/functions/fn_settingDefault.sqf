/*
 * Function: grad_minui_fnc_settingDefault
 * Author: DerZade
 *
 * Find default value of setting.
 *
 * Arguments:
 * 0: Setting <STRING>
 *
 * Return Value:
 * Setting default valur (nil if not found) <ANY>
 *
 * Example:
 * _default = ["chat_enabled"] call grad_minui_fnc_settingDefault;
 *
 * Public: No
 */
params [
    ["_setting", "", [""]]
];

_setting = toLower _setting;

private _cache = uiNamespace getVariable "grad_minui_settings_defaultCache";
if (isNil "_cache") then {
	_cache = createHashMap;
	uiNamespace setVariable ["grad_minui_settings_defaultCache", _cache];
};

if !(_setting in _cache) then {
	private _config = [_setting] call grad_minui_fnc_settingConfig;
	if (isNull _config) exitWith {
		["Couldn't find config for setting '%1'.", _setting] call BIS_fnc_error;
	};

	private _type = [_config, "type", ""] call BIS_fnc_returnConfigEntry;
	private _valueInfo = [_config, "valueInfo", ""] call BIS_fnc_returnConfigEntry;

	private _default = switch (_type) do {
		case "CHECKBOX": {
			call compile _valueInfo;
		};
		case "EDITBOX": {
			_valueInfo;
		};
		case "LIST": {
			private _arr = call compile _valueInfo;
			_arr params ["_values", "", "_index"];
			_values select _index;
		};
		case "SLIDER": {
			private _arr = call compile _valueInfo;
			_arr select 2;
		};
		case "COLOR": {
			call compile _valueInfo;
		};
		default {
			["Config for setting '%1' has invalid 'type' entry.", _setting] call BIS_fnc_error;
			nil;
		};
	};

	_cache set [_setting, _default];
};

_cache get _setting;
