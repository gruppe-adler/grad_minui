#include "script_component.hpp"

#define WARNING_FORMAT(txt, arr) format ["<t align='left'>%1<br/>%2</t>", txt, arr apply { "    • " + _x } joinString "<br/>"]

// init keybinds
{
    private _component = configName _x;
    {
        [
            MODDISPLAYNAME,
            format ["grad_minui_%1_%2", _component, configName _x],
            [_x, "title"] call BIS_fnc_returnConfigEntry,
            compile ([_x, "downCode"] call BIS_fnc_returnConfigEntry),
            ""
        ] call CBA_fnc_addKeybind;
    } forEach ("true" configClasses _x);
} forEach ("true" configClasses (configfile >> QUOTE(MOD_CONFIG_CLASS_NAME) >> "keybinds"));


// react to setting changes
["CBA_SettingChanged", {
    params ["_setting", "_value"];

    _setting = toLower _setting;

    // we only want to react to grad_minui settings 
    if ((_setting find "grad_minui_") isNotEqualTo 0) exitWith {};

    private _settingWithoutPrefix = _setting select [(count "grad_minui_")];
    private _config = [_settingWithoutPrefix] call grad_minui_fnc_settingConfig;
    if (isNull _config) exitWith {};

    private _needsMissionRestart = ([_config, "needsMissionRestart", 0] call BIS_fnc_returnConfigEntry) isEqualTo 1;
    private _needsGameRestart = ([_config, "needsGameRestart", 0] call BIS_fnc_returnConfigEntry) isEqualTo 1;
    private _title = [_config, "title", ""] call BIS_fnc_returnConfigEntry;

    if (!_needsMissionRestart && !_needsGameRestart) exitWith {};

    if (isNil "grad_minui_restartSettings") then {
        grad_minui_restartSettings = [[], []];
        [
            {
                grad_minui_restartSettings params [["_mission", []], ["_game", []]];

                private _texts = [];

                if (count _game > 0) then {
                    _texts pushBack WARNING_FORMAT(localize "STR_GRAD_MINUI_WARNING_GAME_RESTART", _game);
                }; 

                if (count _mission > 0) then {
                    _texts pushBack WARNING_FORMAT(localize "STR_GRAD_MINUI_WARNING_MISSION_RESTART", _mission);
                }; 

                if (count _texts < 1) exitWith {};

                hint parseText format ["<t size='1.5' color='#d18d1f' undeline='1'>Gruppe Adler Minimalistic UI</t><br/><br/>%1", _texts joinString "<br/><br/>"];

                grad_minui_restartSettings = nil;
            },
            [],
            0.5
        ] call CBA_fnc_waitAndExecute;
    };

    (grad_minui_restartSettings select _needsGameRestart) pushBackUnique _title;
}] call CBA_fnc_addEventHandler;