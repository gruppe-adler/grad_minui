/*
 * Function: grad_minui_fnc_EHgetIn
 * Author: DerZade
 *
 * Triggered by GetInMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetInMan
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 4: Init (set to true when this is manually called in initUnit) <BOOL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    "",
    "",
    "",
    ["_init", false, [false]]
];

if (isNull _unit) exitWith { ["Unit must not be null"] call BIS_fnc_error; };

["grad_minui_foot", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

[_unit] call grad_minui_fnc_EHseatSwitched;

if (_init) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};
