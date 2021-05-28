/*
 * Function: grad_minui_fnc_EHgetIn
 * Author: DerZade
 *
 * Triggered by GetInMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetInMan
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 4: postInit <BOOL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

params ["_unit", "", "", "", ["_postInit", false]];

//remove onEachFrame-Handler
["grad_minui_foot", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

if (_postInit) then {
    grad_minui_ffv = false;
};

[_unit] call grad_minui_fnc_EHseatSwitched;

if (_postInit) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};
