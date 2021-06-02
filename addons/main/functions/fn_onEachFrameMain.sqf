/*
 * Function: grad_minui_fnc_onEachFrameMain
 * Author: DerZade
 *
 * Called upon each frame. Checks for changes in the controlled unit
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

private _player = [] call grad_minui_fnc_player;

if (grad_minui_player isEqualTo _player) exitWith {};

[grad_minui_player] call grad_minui_fnc_deInitUnit;

grad_minui_player = _player;
[grad_minui_player] call grad_minui_fnc_initUnit;
