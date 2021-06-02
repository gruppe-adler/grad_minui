/*
 * Function: grad_minui_fnc_EHgetOut
 * Author: DerZade
 *
 * Triggered by GetOutMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetOutMan
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 4: Init (set to true when this is manually called in initUnit)  <BOOL>
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

// show all info upon spawn / if desired by user
if (_init || ['weaponInfo_showOnGetOut'] call grad_minui_fnc_setting) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};

["grad_minui_ffv", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

// update variables
grad_minui_mode = currentWeaponMode _unit;
grad_minui_muzzle = currentMuzzle _unit;
grad_minui_throwable = currentThrowable _unit;
grad_minui_zeroing = currentZeroing _unit;
grad_minui_magazine = currentMagazine _unit;
grad_minui_ffv = false;

// init onEachFrame-Handler
["grad_minui_foot", "onEachFrame", grad_minui_fnc_onEachFrameFoot] call BIS_fnc_addStackedEventHandler;
