/*
 * Function: grad_minui_fnc_EHgetIn
 * Author: DerZade
 *
 * Triggered by GetInMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetInMan
 *
 * Arguments:
 * 0: Unit <OBJECT>
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
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith { ["Unit must not be null"] call BIS_fnc_error; };

[_unit] call grad_minui_fnc_EHseatSwitched;
