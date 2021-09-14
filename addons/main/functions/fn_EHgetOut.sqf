/*
 * Function: grad_minui_fnc_EHgetOut
 * Author: DerZade
 *
 * Triggered by GetOutMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetOutMan
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

// show all info upon spawn / if desired by user
if (['weaponInfo_showOnGetOut'] call grad_minui_fnc_setting) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};

// init onEachFrame-Handler if unit sat on non FFV seat there may be none.
[] call grad_minui_fnc_enableWeaponInfo;
