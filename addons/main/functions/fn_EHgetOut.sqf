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

// update variables
grad_minui_mode = currentWeaponMode _unit;
grad_minui_muzzle = currentMuzzle _unit;
grad_minui_throwable = currentThrowable _unit;
grad_minui_zeroing = [_unit] call grad_minui_fnc_zeroing;
grad_minui_magazine = currentMagazine _unit;

// show all info upon spawn / if desired by user
if (['weaponInfo_showOnGetOut'] call grad_minui_fnc_setting) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};

// init onEachFrame-Handler if unit sat on non FFV seat there may be none.
// We don't care if there is already a handler, adding same type of EH with the same id will overwrite existing.
["grad_minui_weaponInfo", "onEachFrame", grad_minui_fnc_onEachFrameWeaponInfo] call BIS_fnc_addStackedEventHandler;
