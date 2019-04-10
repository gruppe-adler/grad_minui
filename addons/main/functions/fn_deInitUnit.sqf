/*
 * Function: grad_minui_fnc_deInitUnit
 * Author: DerZade
 *
 * De-initialize given unit. Removes EHs.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

params ["_unit"];

private _var = _unit getVariable ["grad_minui_EHIDs", []];
if (count _var isEqualTo 0) exitWith {};

_var params ["_ssEH", "_giEH", "_goEH"];
_unit removeEventHandler ["SeatSwitchedMan", _ssEH];
_unit removeEventHandler ["GetInMan", _giEH];
_unit removeEventHandler ["GetOutMan", _goEH];

_unit setVariable ["grad_minui_EHIDs", nil, true];

["grad_minui_ffv", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
["grad_minui_foot", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;