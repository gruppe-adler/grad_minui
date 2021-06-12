#include "script_component.hpp"

#define MODDISPLAYNAME "GRAD MinUI"

// init settings
{
    private _component = configName _x;
    private _categoryName = [_x, "categoryName", _component] call BIS_fnc_returnConfigEntry;

    {
        private _type = [_x, "type"] call BIS_fnc_returnConfigEntry;
        private _title = [_x, "title"] call BIS_fnc_returnConfigEntry;
        private _tooltip = [_x, "tooltip", _title] call BIS_fnc_returnConfigEntry;
        private _valueInfo = [_x, "valueInfo"] call BIS_fnc_returnConfigEntry;
        private _script = [_x, "script", ""] call BIS_fnc_returnConfigEntry;

        private _params = [
            format ["grad_minui_%1_%2", _component, configName _x],
            _type,
            [_title, _tooltip],
            [MODDISPLAYNAME, _categoryName],
            call compile _valueInfo,
            2
        ];

        if (_script isNotEqualTo "") then {
            _params pushBack (call compile _script);
        };

        _params call CBA_fnc_addSetting;
    } forEach("true" configClasses _x);
} forEach("true" configClasses (configfile >> QUOTE(MOD_CONFIG_CLASS_NAME) >> "settings"));

// init keybinds
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
} forEach ("true" configClasses (configfile >> QUOTE(MOD_CONFIG_CLASS_NAME) >> "keybinds"));
